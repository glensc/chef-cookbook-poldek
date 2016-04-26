#
# Cookbook Name:: poldek
# Attributes:: default
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

# Cache directory for downloaded files.
default['poldek']['cachedir'] = '/var/cache/poldek'

# Full path name to a PM binary.
default['poldek']['pm command'] = '/usr/lib/poldek/pm-command.sh'

# RPM 4.4.6 introduces auto dependencies based on package directories.
default['poldek']['auto directory dependencies'] = 'auto'

# AC specific overrides
if node['platform_family'] == 'pld' && node['platform_version'].to_i < 3
  # disable this for ac
  default['poldek']['auto directory dependencies'] = 'no'
  # pm command not ported to ac
  # https://bugs.launchpad.net/poldek/+bug/1575176
  default['poldek']['pm command'] = nil
end

# Prevent package listed from being upgraded if they are already installed.
# hold = kernel* foo*.i686 th-test:* *-smp-* th-ready:bar*.x86_64
# Only the key is used, value can be used for descriptive purposes
default['poldek']['hold'] = {
  'kernel*' => 'Always hold kernel packages',
}

# Ignore package list - packages fits given mask will be invisible.
# ignore = *-smp-* foo*
# Only the key is used, value can be used for descriptive purposes
default['poldek']['ignore'] = {
  'vserver-packages' => 'Ignore vserver-packages by default',
}

# enable, if you wish poldek recipe to manage poldek config.
default['poldek']['manage'] = false
