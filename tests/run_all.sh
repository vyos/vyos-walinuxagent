#!/bin/bash
#
# This script is used to set up a test env for extensions
#
# Copyright 2014 Microsoft Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

script=$(dirname $0)
root=$script
cd $root
root=`pwd`

echo "Run unit test:"
tests=`ls test_*.py | sed -e 's/\.py//'`
for test in $tests ; do
    echo $test
done

if [ "$1" == "-c" ] ; then
    echo $tests | xargs coverage run -m unittest
else
    echo $tests | xargs python -m unittest
fi
