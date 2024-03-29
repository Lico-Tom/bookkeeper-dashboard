#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

DIR="$( cd "$( dirname "$0"  )" && pwd  )"

bash -x $DIR/portal/build.sh
mvn -B clean package -Dmaven.test.skip=true
mkdir -p $DIR/dist
rm -rf $DIR/dist/*
cp -r $DIR/portal/dist/bookkeeper-dashboard $DIR/dist/static
cp $DIR/target/bookkeeper-dashboard-0.0.1-SNAPSHOT.jar $DIR/dist/bookkeeper-dashboard.jar
cp -r $DIR/target/lib $DIR/dist/lib
cp -r $DIR/target/conf $DIR/dist/conf
cd $DIR
