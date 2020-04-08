# Jungle

A mini e-commerce application built with Rails 4.2.

Users will be able to sort by product category, add items to their cart and checkout. The Stripe API was used to simulate credit card payments and [an account is required](https://dashboard.stripe.com/register) to view the order confirmation screen.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account to see order confirmation and the full user experience.
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 with any future expiry date and security code for seeing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Screenshots

!["Screenshot of the home page"](https://raw.githubusercontent.com/stevencschoi/jungle-rails/master/docs/home-page.png)

!["Screenshot of product details"](https://raw.githubusercontent.com/stevencschoi/jungle-rails/master/docs/product-details.png)

!["Screenshot of cart"](https://raw.githubusercontent.com/stevencschoi/jungle-rails/master/docs/cart.png)

!["Screenshot of order confirmation screen"](https://raw.githubusercontent.com/stevencschoi/jungle-rails/master/docs/order-confirmation.png)

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
