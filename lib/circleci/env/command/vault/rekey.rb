require "circleci/env/vault"

module Circleci
  module Env
    module Command
      module Vault
        class Rekey
          include Circleci::Env::Vault

          def initialize(current_password:, new_password:)
            @current_password = current_password
            @new_password = new_password
          end

          def run
            puts ""
            puts "=== Rekey Secret Variables".light_blue
            secrets(@current_password) do |name, contents|
              puts "Rekey #{name}"
              write(name, contents.to_str, @new_password)
            end
          end
        end
      end
    end
  end
end
