#!/usr/bin/env bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [[ "${HADOOP_SHELL_EXECNAME}" = hadoop
   || "${HADOOP_SHELL_EXECNAME}" = mapred ]]; then
  hadoop_add_subcommand "distcp" "copy file or directories recursively"
fi

## @description  distcp command for hadoop
## @audience     public
## @stability    stable
## @replaceable  no
function hadoop_subcommand_distcp
{
  # shellcheck disable=SC2034
  HADOOP_CLASSNAME=org.apache.hadoop.tools.DistCp
  hadoop_add_to_classpath_tools hadoop-distcp
  hadoop_debug "Appending HADOOP_CLIENT_OPTS onto HADOOP_OPTS"
  HADOOP_OPTS="${HADOOP_OPTS} ${HADOOP_CLIENT_OPTS}"
}

## @description  distcp command for mapred (calls hadoop)
## @audience     public
## @stability    stable
## @replaceable  no
function mapred_subcommand_distcp
{
  hadoop_subcommand_distcp
}