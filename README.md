tyler caudill

# Supermarket Sweep

Fork this repository and clone your newly created repository. At the end of the challenge, push your code to your repository and DM all of the instructors with the link to your repository.

## Be sure to read all user stories BEFORE beginning your work
---

## Setup

* Fork this repository
* Clone down your forked repository
* Perform the usual setup steps after cloning a Rails application:
  - `bundle install`
  - `rails db:{create,migrate,seed}`
---

### Submission

When you have completed this challenge, submit by DMing the instructors with a link to your repo. Include the following information:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through
---
### Requirements

* TDD all new work
* any model METHODS you write must be fully tested.
* any model RELATIONSHIPS you create must be fully tested.
* use of scaffolding is not permitted on this assessment.
* complete only what user stories request.
---
### Not Required

* No visual styling is required or expected
---

### Challenge Description

Supermarket Sweep is an app that tracks Supermarkets, the customers that they serve and the items that those customers purchase. Supermarkets have many customers. Customers belong to a Supermarket. Customers have many Items and Items have many Customers.

Supermarkets have a name and a location.

Customers have a name.

Items have a name and a price (this can be stored as an integer)


Two migrations have been made for you. The one to many relationship has been set up. You will need to create migrations for the many to many relationship between items and customers. You do not need to do model testing for validations, just make sure you test any relationships and model methods that you create.

## User Stories

```
Story 1 of 3
As a visitor,
When I visit a customer show page,
I see its a list of its items
And the name of the supermarket that it belongs to
```

```
Story 2 of 3
As a visitor,
When I visit a customer show page,
I see the total price of all of its items
```

```
Story 3 of 3
As a visitor,
When I visit a supermarket show page,
I see the name of that supermarket,
And I see a link to view all of the items that the supermarket has
And when I click on the link,
I am taken to the supermarkets item index page,
And I can see a UNIQUE list of all the items that the supermarket has
```

```
Extension
As a visitor,
When I visit a supermarket's show page
I can see the three most popular items that are available in the supermarket,
(Popularity is based on how many customers are associated with that item)
```
