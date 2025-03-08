# Cobbler Hackathon

Sandbox Team: Cobblers (Ben Morey, Hayden Enloe, Kyler Cressall)

This is the backend functionality for our Sandbox hackathon submission. Primarily it will handle running the API's that the frontend app will use to fetch data from the database.

The server functionality is located in the root folder and the documentation (including sql statements, tables/ER Diagram, and additional notes) is located in the documentation folder.

### Server Start Instructions

- Clone the repo
- Install NodeJS if not already downloaded
- Run `npm install` to get packages used in package.json
- Run `npn start` to run server file (alternately `node server.js`)
- Go to `localhost:5000` or the port it is running on and add to the URL to hit different API's

### Server Usage

In the server.js file, there will be many get() app.get functions that look for arguments in the url to perform a specific query.

For example, in a function app.get('/data/:id' ...) you fetch from the url "localhost:5000/data/1" to submit 1 to the function.

If the data url returns a record in the database by the id integer provided, you fetch with `fetch('http://localhost:5000/data/${id}')` and you will get a json object returned like {"id":1, "username":"myusernameplaintext", email:"my@email.com}, or a list of json objects in a row [{id:1},{id:2},{id:3}] if the query will return many records.

To submit data in a query, you hit the same url like before, but (usually) instead of returning a proper record you get a status code or a json object like {"error":"error message here"}.

To test the frontend before I implement the server, act like the fetch worked and use a hardcoded json object to extract data from and display it. The json object's data will be different from each table or when joining/referencing across tables in the proper server, but the column names are in the ER diagram or the create_tables.sql file (which is subject to change, but relatively easy to change in the frontend if the column name is a different string than you expected).

### Scope

The scope of the server is going to be slightly larger than I said in our initial planning meeting, meaning there will be functionality in having seperate users with their own connections. It ended increased the complexity only slightly, as the user is basically a normal node object with credentials to login.

One part of the scope I will definitely not be including for the hackathon (but for the final project) is security. Basically the dummy database can be edited/changed/deleted with basically no restrictions if you know what comands to ping the server with. This will help get us a functional site to use as a demo, but obviously not customer ready. Extended on this, I don't plan to implement credentials/authentication to get the connecitons for each user, (to be very clear this will be implemented later) and in the demo we will likely just have a dropdown or something to choose the active user to display.

### Relevant Links

Frontend Repo: https://github.com/benmorey/cobbler_web_app

Landing Page Repo: https://github.com/haydenenloe/cobbler-landing-page

Demo/landing page setup on: (todo, hosted link)

Our githubs/links:

- Ben Morey https://github.com/benmorey/
- Hayden Enloe https://github.com/haydenenloe/
- Kyler Cressall https://github.com/kylercressall
