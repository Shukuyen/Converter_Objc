Feature: 
  As an iOS developer
  I want to have a sample feature file
  So I can see what my next step is in the wonderful world of Frank/Cucumber testing

Scenario: 
    Rotating the simulator for demonstration purposes
Given I launch the app
When I touch "2"
And I touch "3"
Then I should see "23" in the display
