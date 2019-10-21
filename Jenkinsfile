node {
    def app
    env.ORG_NAME = 'mrityunjay'
    env.PROJECT_NAME = 'hello-world'
    env.DOCKER_REGISTRY = 'http://localhost:5050'
    env.TAG = 'latest'    
    stage('Clone repository') {
        /*  Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }
    stage('Build image') {
        /*  This builds the actual image; synonymous to
         *  docker build on the command line */
        app = docker.build("${env.ORG_NAME}/${env.PROJECT_NAME}")
    }
    stage('Check') {
        /*  Install eslint and eslint-config-google
         *   check your code againts the config */
        app.inside {
            sh 'echo "Audit"'
            sh 'npm install -g eslint'
            sh 'npm install -g eslint-config-google'
            sh 'eslint .'
        }
    }
    stage('Audit') {
        /* Run audit checks to verify your package dependencies */
        app.inside {
            sh 'echo "Audit"'
            sh 'npm audit'
        }
    }
    /*
     * If you have defined test cases in your repo, then you can run them here
    stage('Test') {
        app.inside {
            sh 'npm i g mocha'
            sh 'npm test'
        }
    }
    */
    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused.
         * If your custom registry requires authorization, create a credential and use it as below,
         * docker.withRegistry("${env.DOCKER_REGISTRY}", "credentials-id") {*/
        docker.withRegistry("${env.DOCKER_REGISTRY}") {
            app.push("${env.BUILD_NUMBER}")
            app.push("${env.TAG}")
        }
    }
}