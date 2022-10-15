\connect Inventory_Sales

DROP TABLE IF EXISTS inventory;

CREATE TABLE inventory(
    Item_ID SERIAL PRIMARY KEY,
    Product_Name TEXT NOT NULL,
    Product_Description TEXT NOT NULL,
    Product_Type TEXT NOT NULL,
    Stock_Level INT NOT NULL);

;

DROP TABLE IF EXISTS sales_orders;

CREATE TABLE sales_orders(
    Order_number SERIAL PRIMARY KEY,
    Item_ID INT,
    quantity INT NOT NULL,
    shipped_date DATE NOT NULL,
    CONSTRAINT fk_itemID FOREIGN KEY (Item_ID) REFERENCES inventory(Item_ID) ON DELETE CASCADE);


CREATE TABLE employees(
    EMP_ID SERIAL PRIMARY KEY,
    First_Name TEXT NOT NULL,
    Last_Name TEXT NOT NULL,
    Title TEXT NOT NULL,
    phone TEXT,
    hired_date DATE NOT NULL);


CREATE TABLE purchase_orders(
    PO_ID SERIAL PRIMARY KEY,
    Item_ID INT,
    quantity INT NOT NULL,
    Purchase_date DATE NOT NULL,
    CONSTRAINT fk_po_itemID FOREIGN KEY (Item_ID) REFERENCES inventory(Item_ID) ON DELETE CASCADE);


CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    First_Name TEXT NOT NULL,
    Last_Name TEXT NOT NULL,
    email TEXT,
    Phone_number TEXT,
    CITY TEXT);


CREATE TABLE sale_invoices(
    invoice_number SERIAL PRIMARY KEY,
    Order_Number INT,
    Customer_ID INT,
    EMP_ID INT,
    DISCOUNT FLOAT,
    Invoice_Date DATE NOT NULL,
    CONSTRAINT fk_SI_order_number FOREIGN KEY (Order_number) REFERENCES sales_orders(Order_number) ON DELETE CASCADE,
    CONSTRAINT fk_SI_customerID FOREIGN KEY (Customer_ID) REFERENCES customers(customer_id) ON DELETE CASCADE,
    CONSTRAINT fk_SI_EmpID FOREIGN KEY (EMP_ID) REFERENCES employees(EMP_ID) ON DELETE CASCADE);


CREATE TABLE suppliers(
    supplier_id SERIAL PRIMARY KEY,
    supplier_address TEXT,
    Company_Name TEXT NOT NULL,
    Net_TERMS INT,
    Date_Contracted DATE);




CREATE TABLE purchase_invoices(
    Purchase_number SERIAL PRIMARY KEY,
    PO_ID INT,
    Supplier_ID INT,
    Amount FLOAT,
    Purchase_Date DATE,
    CONSTRAINT fk_pi_POID FOREIGN KEY (PO_ID) REFERENCES purchase_orders(PO_ID) ON DELETE CASCADE,
    CONSTRAINT fk_pi_supplierID FOREIGN KEY (Supplier_ID) REFERENCES suppliers(supplier_id) ON DELETE CASCADE);

