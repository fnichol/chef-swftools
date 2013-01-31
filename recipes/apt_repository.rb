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

repo_name      = node['swftools']['repository']['name']
repo_uri       = node['swftools']['repository']['url']
keyserver_url  = node['swftools']['keyserver']['url']
keyserver_key  = node['swftools']['keyserver']['key']

include_recipe "apt"

%w{python-software-properties pkg-config}.each do |pkg|
  package pkg
end

apt_repository repo_name do
  uri           repo_uri
  distribution  node['lsb']['codename']
  components    ["main"]
  keyserver     keyserver_url
  key           keyserver_key

  action        :add
  notifies      :run, "execute[apt-get update]", :immediately
end
