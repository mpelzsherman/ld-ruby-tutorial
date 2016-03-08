require 'ldclient-rb'

client = LaunchDarkly::LDClient.new("sdk-32c7ee35-cf5e-42e1-a72d-4c2806d2d0c2")

bob = {
  key: "bob@test.com",
  firstName: "Bob",
  lastName: "Loblaw",
  custom: {
    groups: "beta_testers"
  }
}

joe = {
    key: "joe@test.com",
    firstName: "Joe",
    lastName: "Schmoe",
    custom: {
        groups: "schmoes"
    }
}

[bob, joe].each do |user|
  if client.toggle?("angry-wombats", user, false)
    # application code to show the feature
    puts "Showing your feature to #{user}"
  else
    # the code to run if the feature is off
    puts "Not showing your feature to #{user}"
  end
end

client.flush()
