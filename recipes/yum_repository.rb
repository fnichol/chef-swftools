#
# Cookbook Name:: swftools
# Recipe:: yum_repository
#
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

node.default['yum']['rpmforge']['enabled'] = true
node.default['yum']['rpmforge']['managed'] = true

include_recipe 'yum-repoforge'
#https://github.com/opscode-cookbooks/yum-repoforge


 yum_repository 'rpmforge' do
    mirrorlist 'http://mirrorlist.repoforge.org/el6/mirrors-rpmforge'
    description 'RHEL $releasever - RPMforge.net - dag'
    enabled true
    gpgcheck true
    gpgkey 'http://apt.sw.be/RPM-GPG-KEY.dag.txt'
  end
