#!/bin/bash

projects=("commons-pool" "HikariCP" "commons-io" "commons-dbcp" "commons-beanutils" "commons-compress" "commons-configuration")

for project in "${projects[@]}"
do
    echo "🚀 Processing $project"
    cd "$project"

    echo "🔹 기본 테스트 실행"
    mvn clean install

    echo "🔹 Ekstazi 선택적 테스트 실행"
    mvn ekstazi:select
    mvn test

    echo "✅ 실험 완료 ($project)"
    cd ..
done