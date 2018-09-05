if [ ${TRAVIS_PULL_REQUEST} = 'false' ] && [[ $TRAVIS_BRANCH = 'master'  ||  ${TRAVIS_BRANCH} = 'develop' ]]; then
      echo 'Checking Quality Gates'
      mvn -B clean verify sonar:sonar \
      -Dsonar.host.url=${SONAR_URL} \
      -Dsonar.login=${SONAR_LOGIN} \
      -Dsonar.projectKey=${SONAR_PROJECT} \
      -Dsonar.organization=${SONAR_ORGANIZATION}
elif [ ${TRAVIS_PULL_REQUEST} != 'false' ]; then
      echo 'Build and analyze pull request'
      mvn -B clean verify sonar:sonar -Dsonar.analysis.mode=issues -Dsonar.host.url=${SONAR_URL} -Dsonar.login=${SONAR_LOGIN} -Dsonar.organization=${SONAR_ORGANIZATION} -Dsonar.github.oauth=${SONAR_GITHUB_OAUTH} -Dsonar.github.repository=Nourelhouda1995/Boomer2 -Dsonar.github.pullRequest=${TRAVIS_PULL_REQUEST};
fi
