#
# Cookbook Name:: poldek
# Resource:: repository
#
# Copyright 2016, Elan Ruusamäe
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

actions :add, :remove
default_action :add

attribute :repo_name, kind_of: String, name_attribute: true, regex: [/^([a-z]|[A-Z]|[0-9]|_|-|\.)+$/]
attribute :type, kind_of: String, default: 'pndir'
attribute :path, kind_of: String
attribute :auto, kind_of: [TrueClass, FalseClass], default: false
attribute :autoup, kind_of: [TrueClass, FalseClass], default: false
attribute :ignore, kind_of: Array, default: []
