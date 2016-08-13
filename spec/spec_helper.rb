require 'devise'
require 'pundit/rspec'
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end


  config.shared_context_metadata_behavior = :apply_to_host_groups
  # Disable monkey-patched syntaxes
  config.disable_monkey_patching!

  # Be more verbose when running a single test
  config.default_formatter = 'doc' if config.files_to_run.one?

  # Show the 2 slowest specs
  config.profile_examples = 2

  # Randomize - if there's an order where the tests break, a seed can be passed
  # in via --seed to reproduce
  config.order = :random
  Kernel.srand config.seed

end
