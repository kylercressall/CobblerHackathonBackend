### Project Requirements

User refers to the person who is the main/center node of their connections and who owns the account.
Connection refers to another person/node that the user is conected to.
Relationship refers to the relationship between the user and their connections.

Functional Requirements

- Users should be able to select a user and view their network
  - (outside of the hackathon we will have proper authentication and dynamic user creation)
- Users should be able to see details about their accoun in the form of a map node or table row
- Users should be able to create new connections (nodes)
- The system should create a visual connection from the user to a new connection indicated by a line or arrow
- Users should be able to access the information associated to their conenctions
- Users should be able to add 'social events' to change the strength of their relationship with their connections
- Users should be able to delete connections
- Users should be able to modify and edit the details of their conenction

### ER Diagram and Database Design

Entities and attributes:

- Users
  (account owner)

  - userID - primary key
  - connectionID - foreign key to reference the users node

  - creation_timestamp

- Relationships
  (relationship between users and their connections)

  - relationshipID
  - userID

    - Primary Key (userID, relationshipID)

  - creation_timestamp
  - edit_timestamp

- Connections
  (other people, users or not, that users are connected to)

  - connectionID - Primary Key
  - userID (NULL if they don't have a cobbler account or have not shared it)
  - first_name
  - last_name
  - description

  - creation_timestamp
  - edit_timestamp

- ForeignAccounts
  (the social media accounts and links to list on their profile)

  - userID
  - accountID
    - Primary key (userID, accountID)
  - platform
  - link
  - username

- Events
  (Logged events when the user interacted with a connection,
  used to determine relationship connection and a log of previous contacts)

  - connectionID - Primary key
  - userID
  - title
  - description
  - date

  - strength_score
  - creation_timestamp
  - edit_timestamp
