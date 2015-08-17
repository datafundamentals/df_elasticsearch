#
# Cookbook Name:: df_elasticsearch
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'df_elasticsearch::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect(chef_run).to install_apt_package('elasticsearch')
  end
  it 'creates the elasticsearch config' do 
  	expect(chef_run).to create_template('/etc/elasticsearch/elasticsearch.yml')
    end
  it 'restarts elasticsearch' do 
  	expect(chef_run).to restart_service('elasticsearch')
  end
  end
end
