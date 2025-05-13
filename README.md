# Willy Wonka Factory Databas System

Willy Wonka Factory (WWF) is a fictional chocolate manufacturing company. The database system WWFDB was designed to manage and track all core components of its operations, including ingredients, products, employees, offers, and partner companies. The project includes the design of the ER model (Chen and UML), relational schema, normalization (up to 3NF), full SQL implementation, data population, and testing via queries.

# Key Business Entities

	•	Ingredients: Tracks raw materials used in chocolate production, such as cocoa, sugar, milk, and flavors.
	•	Chocolate Products: Manages various chocolate items, each linked to ingredients and associated with employees and offers.
	•	Employees: Covers staff involved in production and distribution, including personal details, positions, and salaries.
	•	Offers: Stores promotional details like discount percentages and valid date ranges, linked to specific products.
	•	Companies: Represents clients who receive products, including company name, contact info, and annual profits.

# Database Design

The database is normalized to 3NF (Third Normal Form) to ensure data integrity and reduce redundancy:

	•	Ingredients: IngredientID, Name, Quantity
	•	Chocolate Products: ProductID, Name, Flavor, PackagingID
	•	Offers: StartDate, EndDate, Discount
	•	Employees: EmployeeID, Name, Phone, Salary, Position
	•	Companies: CompanyID, Name, Contact, Address, Profit

# Relations:

	•	Many-to-Many between Products and Ingredients
	•	Many-to-Many between Products and Employees
	•	Many-to-Many between Products and Companies
	•	Many-to-Many between Employees and Companies

 # ER Models
 
	•	Chen Notation and UML Notation were used.
	•	Weak entities and multivalued attributes were mapped.
	•	All relationships were resolved with proper keys and foreign keys.

 # Normalization
 
	•	All tables are normalized to Third Normal Form (3NF)
	•	No partial or transitive dependencies remain
	•	Data redundancy was eliminated

 # SQL Implementation
 
	•	Database: WillyWonkaFactoryDB
	•	Tables created: Ingredients, ChocolateProducts, Offers, Employees, Companies, Used, Associate, Receives, Deliver, Choco_Flavors
	•	Inserted sample data into each table
	•	Queries cover SELECT, JOIN, GROUP BY, ORDER BY, UPDATE, DELETE

 # Task Distribution

 	•	Retal Malki: Business Rules, Chen Diagram, UML Diagram, Mapping, Normalization, SQL File.
	•	Aghared Kadu: Table Creation, Data Insertion, Query Implementation, Report Writing
	•	Arwa Alhassani: Testing Queries, Report Editing, Documentation, Final Presentation Slides

 # Business Rules and Policies
 
	•	Quality Control: All chocolate products must undergo strict quality checks before packaging and distribution.
	•	Ingredient Validation: Each ingredient must have a valid ID and a quantity between 0–300 KG.
	•	Food Safety: Packaging must include allergen information and comply with regulatory food safety standards.
	•	Operational Efficiency: Employees must hold valid licenses and follow safe driving and on-time delivery protocols.
	•	Offer Conditions: Discounts can only be applied if the offer start date is after January 1, 2024.
	•	Traceability: Every product, employee, and delivery is tracked through relational connections for full traceability across the supply chain.

This project offers a complete database solution for managing ingredient sourcing, product creation, offer handling, employee assignment, and company deliveries. It emphasizes the role of data-driven design in streamlining operations and ensuring high standards in chocolate production and distribution.
	




