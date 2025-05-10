# Database Planning Checklist for Indoor Plant vs Outdoor Forest Watering App

## 1. Is the data structured or unstructured?
- [ ] 20% of data is structured → Consider RDBMS (SQL)
- [ ] 80% of data is unstructured → Consider NoSQL or schema-less approach
- [ ] Sensor data like GPS may be unstructured and schema may change with firmware updates

## 2. Do we have existing data?
- [ ] Yes → Normalize and fit into table structure, then insert
  - [ ] Inform client this process takes time
- [ ] Fast option → Store as text in one column
- [ ] Integrate recent weather data into the database

## 3. Do we have more or less than 10k rows?
- [ ] More than 10k rows → Consider indexing
  - [ ] Technical task, no client approval needed
- [ ] Example: Sensors generate 20k rows in 20 seconds

## 4. Do we have much more than 10k rows?
- [ ] Consider distributing data across multiple databases
- [ ] Ask client: What’s more critical?
  - [ ] Availability → Focus on patterns over exact values
  - [ ] Consistency → Avoid incorrect watering decisions

## 5. Does the application require transactions (e.g., ordering, registration)?
- [ ] Yes → SQL is required
  - [ ] Refactor only the transaction-related data for SQL
- [ ] No transactions → Skip relational model

## 6. Are there legal or data-related requirements?
- [ ] If yes → Licensing matters
  - [ ] Option 1: Use open-source DBs, we are accountable
  - [ ] Option 2: Use commercial DBs, we are not accountable
- [ ] We need to confirm this with the client

## 7. What's prioritized: User experience or Security?
- [ ] User experience → Decryption affects performance
- [ ] Security → Encrypt specific columns
  - [ ] Encrypted columns cannot be queried directly
  - [ ] Schema must be altered for encryption

## 8. Is the database accessed by a large organization (e.g., hospital)?
- [ ] Yes → Role-based access control takes time
  - [ ] Ignore access control during testing
  - [ ] DB admin can grant/revoke privileges quickly

## 9. Is the database read-only?
- [ ] Yes → Optimizations possible
  - [ ] CAP theorem and indexing are less of a concern
  - [ ] Store data by use case: read-only table vs. write table

## 10. How should the database be structured?
- [ ] By behavior
- [ ] By business logic
- [ ] By technical aspects
  - [ ] A good full stack engineer considers all three and balances trade-offs

## 11. Is the application real-time (e.g., dashboard)?
- [ ] Yes → Consider column-based DBs like ClickHouse
  - [ ] Inform client: prioritizing data availability over consistency
