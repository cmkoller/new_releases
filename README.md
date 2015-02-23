## New Releases App

### User Stories

```no-highlight
As a user
I want to view a list of newly released albums
So that I can find new music

Acceptance Criteria:
- I see a list of newly released albums.
- I can click on the name of an album to be taken to that album's page.
```

```no-highlight
As a user
I want to view a new album's information
So I can decide if I want to listen to it

Acceptance Criteria:
- I see the album's name, type, artist(s), popularity, and url.
```

```no-highlight
As a user
I want to add a new album
So I can recommend it to others

Acceptance Criteria:
- I must provide a name and artist. If I don't, I receive an error message.
- I can also provide a popularity between 0 and 100 and a url.
- If I provide a popularity level that's not between 0 and 100, I receive an error message.
```

### Problem decomposition

**STEP 1 - Pick a user story or feature.**

Let's start with viewing a list of new releases. What kind of page do we want? An albums index page.

**STEP 2 - Start with the HTTP request and build out the parts of your app till your feature is complete.**

What happens inside my app when I navigate to my "/albums" page? (Try it - you should get a "Sinatra doesn't know this ditty" message.)

* First, I look for a block in my `server.rb` file that matches the `GET /albums` request. Let me write that first:

  ```ruby
  # new_releases/server.rb

  require 'sinatra'

  get '/albums' do
  end
  ```

* Now, this `get '/albums'` block doesn't do much yet. Navigate to this page in the browser. What do I see? Nothing. What do I ultimately want to see? A list of albums.

* What's the next step for me to show all the albums? You could start in two places:
  1. Create the `index.erb` view, or
  2. Create an `@albums` instance variable to pass to the `index.erb` view.

* Let's start with adding the `index.erb` view.
  - Where should I put this view?
    - `new_releases/views/index.erb` vs.
    - `new_releases/views/albums/index.erb`
  - Now I have my view, I need to make sure it is rendered in the browser:
    ```ruby
    # new_releases/server.rb

    require 'sinatra'

    get '/albums' do
      erb :'albums/index'
    end
    ```

* What's next? Displaying the albums. What do I need to do to do that?
  - Read in albums from the CSV and create an `@albums` instance variable in my `get` block
  - Iterate over that `@albums` instance variable in my `index.erb` file

* Anything else? I need to link to each album's page.

Once complete, I can refactor!  And then move on to the next user story.

Our third user story has some more complicated pieces.

* First, I'd try to get the base case working: Let's assume that any input is OK.
* Now, let's make sure that users can't submit an album without a name.  Then, we can add a validation for description, and so forth until we've hit all of our validations.

*Credit to [Helen Hood](https://github.com/hchood/new_releases) for lesson text!*
