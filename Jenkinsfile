pipeline {
    agent any
	environment {
    		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
    		}
    stages {
        stage('Checkout GIT') {
            steps {
                echo 'Pulling... ';
                    git branch: 'sahar',
                        url : 'https://github.com/louatisahar/DevOps',
                        credentialsId: 'd6ff7a98-2a40-49d0-b15b-408198b39b88';
            }
        }

        stage('Cleaning the project') {
             
             
            steps {
                echo 'cleaning project ...'
                sh 'mvn clean'
            }
        }
        
        stage('Compiling the artifact') {
             
            steps {
                echo "compiling"
                sh 'mvn compile'
               
            }
        } 
        stage('Nexus') {
            steps {
                sh 'mvn deploy'
            }
        }  
        stage('Code Quality Check via SonarQube') {
            steps {
                script {
                        sh 'mvn sonar:sonar -Dsonar.login=admin -Dsonar.password=admin.'
						}
               
            }
        }
           
     stage ('Mockito/Junit') {
             steps {
            sh 'mvn test -Dtest="FactureServiceImplMockito" '
            sh 'mvn test -Dtest="ReglementServiceImpTest" '
            }
        }
        stage('Docker build')
        {
            steps {
                 sh 'docker build -t $DOCKERHUB_CREDENTIALS_USR/tpachatproject-1.0:latest .'
            }
        }
         stage('Docker compose ') {
              steps {
                  sh "docker compose -f docker-compose.yml up -d  "
              }
        }
        stage ('Docker login'){
        	steps {
        	sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
        	}
        }
        
        stage ('Docker push'){
        	steps {
        	sh 'docker push $DOCKERHUB_CREDENTIALS_USR/tpachatproject-1.0:latest'
        	}
        }
        
        
       
    }
}