#
# Cookbook Name:: swftools
# Recipe:: apt_repository
#
# Copyright 2011, Fletcher Nichol
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

name      = node['swftools']['repository']['name']
uri       = node['swftools']['repository']['url']
keyserver = node['swftools']['keyserver']['url']
key       = node['swftools']['keyserver']['key']

include_recipe "apt"

%w{python-software-properties pkg-config}.each do |pkg|
  package pkg
end

apt_repository name do
  uri           uri
  distribution  node['lsb']['codename']
  components    ["main"]
  keyserver     keyserver
  key           key

  action        :add
  notifies      :run, "execute[apt-get update]", :immediately
end
