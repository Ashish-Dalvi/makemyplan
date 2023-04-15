pipeline {

    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }
    agent any

    tools {
        maven 'mymaven'
    }

    stages {
        stage('Code Compilation') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('QA Execution') {
            steps {
                sh 'mvn clean test'
            }
        }

        stage('Code Package') {
            steps {
                sh 'mvn clean package'
                archiveArtifacts artifacts: 'target/*.jar'
            }
        }

        stage('Build Docker Image') {
           steps {
                sh 'docker build -t makemyplan .'
           }
         }

        stage('Upload Docker to DockerRegistry') {
           steps {
		      script {
			     withCredentials([string(credentialsId: 'dockerhubC', variable: 'dockerhubC')]){
                 sh 'docker login docker.io -u ashishdalvi -p ${dockerhubC}'
                 echo "Push Docker Image to DockerHub : In Progress"
                 sh 'docker tag 4dd91eb22d0a  ashishdalvi/makemyplan:latest'
				 sh 'docker push ashishdalvi/makemyplan:latest'
				 echo "Push Docker Image to DockerHub : In Progress"
				 }
              }
            }
        }

      //  stage('Upload Docker Image to AWS ECR') {
        //    steps {
		//	   script {
		//	      withDockerRegistry([credentialsId:'ecr:ap-northeast-1:linuxacademy-cred', url:"https://142692870410.dkr.ecr.ap-northeast-1.amazonaws.com/linuxacademy"]){
        //          sh """
        //          echo "List the docker images present in local"
        //          docker images
		//		  echo "Tagging the Docker Image: In Progress"
		//		  docker tag linuxacademy:latest 142692870410.dkr.ecr.ap-northeast-1.amazonaws.com/linuxacademy:latest
		//		  echo "Tagging the Docker Image: Completed"
		//		  echo "Push Docker Image to ECR : In Progress"
		//		  docker push 142692870410.dkr.ecr.ap-northeast-1.amazonaws.com/linuxacademy:latest
		//		  echo "Push Docker Image to ECR : Completed"
		//		  """
		//		  }
        //        }
        //    }
		//}
        stage('Upload the docker Image to Nexus') {
            steps {
                sh 'date;date;date'
            }
        }
        stage('Deploy to Production') {
            steps {
                sh 'date;date'
                //sh 'scp target/*.war jenkins@18.181.74.5:/opt/pet/'
                //sh 'scp target/*.war jenkins-slave-01@172.31.34.125:/home/ec2-user'
                //'scp target/*.war ec2-user@172.31.42.211:/home/dockeradmin'
               // sh "ssh ec2-user@172.31.42.211 'nohup java -war /home/linuxacademy.war &'"
            }
        }

    }
}