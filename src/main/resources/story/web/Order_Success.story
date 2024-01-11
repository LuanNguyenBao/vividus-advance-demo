Meta:
    @group web
    @requirementId Order-Success

Scenario: Navigate to the website homepage
When I navigate to the website homepage

Scenario: Log In
When I fill ${swagGoodUserName}, ${swagPassword} and click button Login in homepage
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`

Scenario: Add items to the shopping cart
When I add to cart the first item have sorting <sortingValue> in Products page
And I save text of element located by `className(shopping_cart_badge)` to scenario variable `totalCartNumber`
Then `${totalCartNumber}` is equal to `<cartBadgeCount>`
Examples:
|sortingValue             |cartBadgeCount   |
|Price (low to high)      |1                |
|Price (high to low)      |2                |

Scenario: Populate checkout data
When I click on element located by `id(shopping_cart_container)`
And I click on element located by `id(checkout)`
And I enter `#{generate(Name.firstName)}` in field located by `id(first-name)`
And I enter `#{generate(Name.lastName)}` in field located by `id(last-name)`
And I enter `#{toUpperCase(#{generate(bothify '???-#####')})}` in field located by `id(postal-code)`

Scenario: Validate order summary and complete order
When I click on element located by `id(continue)`
Then I validate the order summary
When I click on element located by `id(finish)`
And I save text of element located by `tagName(h2)` to scenario variable `thankYouWeb`
Given I initialize scenario variable `thankYouFile` with value `#{loadResource(/data/message_correct.txt)}`
Then `#{eval(`${thankYouFile}` == `${thankYouWeb}`)}` is = `true`
