if [ ${TRAVIS_PULL_REQUEST} = 'false' ] && [[ $TRAVIS_BRANCH = 'master'  ||  ${TRAVIS_BRANCH} = 'develop' ]]; then
      echo 'Checking Quality Gates'
    mvn -B clean verify sonar:sonar -Dsonar.host.url=https://sonarcloud.io -Dsonar.projectKey=Nourelhouda1995_Boomer -Dsonar.organization=nourelhouda1995-github -Dsonar.login=${SONAR_LOGIN} -Dsonar.github.oauth=b5f7cdbab57d8a472de303c399b16ce8c888ea89 -Dsonar.pullrequest.github.repository=skokaina/devops -Dsonar.pullrequest.provider=GitHub -Dsonar.pullrequest.branch=${TRAVIS_BRANCH} -Dsonar.pullrequest.key=${TRAVIS_PULL_REQUEST};

elif [ ${TRAVIS_PULL_REQUEST} != 'false' ]; then
      echo 'Build and analyze pull request'
    mvn -B clean verify sonar:sonar -Dsonar.host.url=https://sonarcloud.io -Dsonar.projectKey=Nourelhouda1995_Boomer -Dsonar.organization=nourelhouda1995-github -Dsonar.login=${SONAR_LOGIN} -Dsonar.github.oauth=b5f7cdbab57d8a472de303c399b16ce8c888ea89 -Dsonar.pullrequest.github.repository=skokaina/devops -Dsonar.pullrequest.provider=GitHub -Dsonar.pullrequest.branch=${TRAVIS_BRANCH} -Dsonar.pullrequest.key=${TRAVIS_PULL_REQUEST};

fi
