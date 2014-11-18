Then(/^I should see "(.*?)" in the display$/) do |value|
  text = frankly_map("label marked:'DisplayLabel'", "text").first
  text.should == value
end
