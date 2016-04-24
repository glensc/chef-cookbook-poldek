#
# Cookbook Name:: poldek
# Library:: helpers
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

module Poldek
  # Helpers for poldek
  module Helpers
    # Determines if poldek is installed on a system.
    #
    # @return [Boolean]
    def poldek_installed?
      !which('poldek').nil?
    end

    # Return keys from hash whose values are not falsy
    #
    # @return []
    def filter_enabled(hash)
      hash.dup.select do |k,v|
        v
      end
    end

    # Build list of comments for each package
    #
    # @return []
    def item_comments(items)
      filter_enabled(items).select do |k, v|
        v.kind_of?(String)
      end.collect do |k, v|
        "# #{k}: #{v}"
      end
    end

    # Finds a command in $PATH
    #
    # @return [String, nil]
    def which(cmd)
      ENV['PATH'] = '' if ENV['PATH'].nil?
      paths = (ENV['PATH'].split(::File::PATH_SEPARATOR) + %w(/bin /usr/bin /sbin /usr/sbin))

      paths.each do |path|
        possible = File.join(path, cmd)
        return possible if File.executable?(possible)
      end

      nil
    end
  end
end

Chef::Recipe.send(:include, ::Poldek::Helpers)
Chef::Resource.send(:include, ::Poldek::Helpers)
Chef::Provider.send(:include, ::Poldek::Helpers)
