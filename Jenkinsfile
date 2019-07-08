def werf_run(werfargs){
  sh """#!/bin/bash -el
  set -o pipefail
  source <(multiwerf use 1.0 alpha)
  werf ${werfargs}""".trim()
}

def DOCKER_REGISTRY = "nexus.lm-edu.flant.ru"
def HV = "hv6"

node ('mfominov') {
    deleteDir()
    stage('repo checkout') {
        checkout scm
    }
    stage('werf build') {
        withCredentials([usernamePassword(credentialsId: 'DOCKER_REGISTRY', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
            sh("docker login -u ${USERNAME} -p ${PASSWORD} ${DOCKER_REGISTRY}")
            werf_run("build-and-publish --stages-storage :local --images-repo ${DOCKER_REGISTRY}/${HV} --tag-custom=1.0.0")
        }
    }
    // stage('werf_deploy') {
    //     werf_run("deploy --env dev --stages-storage :local --images-repo ${DOCKER_REGISTRY}/${HV} --tag-custom=1.0.0")
    // }
}