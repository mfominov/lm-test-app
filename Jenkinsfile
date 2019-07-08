node ('mfominov') {
    deleteDir()
    stage('repo checkout') {
        checkout scm
    }
    stage('werf build')
        sh """source <(multiwerf use 1.0 alpha)
        werf version
        """
}