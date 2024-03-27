CREATE TABLE CRMsystem.Channel (
    ChannelID INT PRIMARY KEY,
    Channel VARCHAR(255) NOT NULL,
    ChannelType VARCHAR(255) NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.TargetAudience (
    TAID INT PRIMARY KEY,
    Description TEXT NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.Promotion (
    PromotionID INT PRIMARY KEY,
    Name TEXT NOT NULL ,
    Description TEXT ,
    Quantity INT NOT NULL ,
    DiscountAmount INT NOT NULL ,
    StartDate DATE NOT NULL ,
    EndDate DATE NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(255) NOT NULL,
    Team VARCHAR(255) NOT NULL,
    PhoneNumber INT NOT NULL,
    CorpEmail VARCHAR(255) NOT NULL,
    PersonalEmail VARCHAR(255) NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    PhoneNumber INT  NOT NULL,
    Email VARCHAR(255),
    Birthday DATE  NOT NULL,
    Address TEXT  NOT NULL,
    PostalCode INT NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.SaleStatus (
    StatusID INT PRIMARY KEY,
    StatusName VARCHAR(255) NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.Location (
    PostalCode INT PRIMARY KEY,
    Country VARCHAR(255) NOT NULL ,
    Region VARCHAR(255) NOT NULL ,
    City VARCHAR(255) NOT NULL ,
    Province VARCHAR(255) NOT NULL ,
    Ward VARCHAR(255) NOT NULL  
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.Shipper (
    ShipperID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL ,
    CompanyName VARCHAR(255) NOT NULL ,
    PhoneNumber INT NOT NULL  
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.Payment (
    PaymentType VARCHAR(255) PRIMARY KEY,
    Desciption VARCHAR(255) NOT NULL 
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.DeliveryType (
    DeliveryType VARCHAR(255) PRIMARY KEY,
    Desciption VARCHAR(255) NOT NULL 
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.Package (
    PackageStatus VARCHAR(255) PRIMARY KEY,
    Desciption VARCHAR(255) NOT NULL 
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.PartnerStatus (
    PartnerStatus VARCHAR(255) PRIMARY KEY,
    Desciption VARCHAR(255) NOT NULL 
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.Category (
    CategoryID INT PRIMARY KEY,
	ProductID TEXT  NOT NULL ,
	CategoryName VARCHAR(50) NOT NULL ,
	Description INT
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.Supplier (
    SupplierID INT PRIMARY KEY,
	CompanyName TEXT NOT NULL ,
	ContactName TEXT NOT NULL ,
	PhoneNumber INT NOT NULL ,
	Address TEXT NOT NULL ,
	Poscode INT NOT NULL ,
	Webside VARCHAR(255) NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.ReorderLevel (
    ReorderLevel INT PRIMARY KEY,
    Description TEXT
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE CRMsystem.Product (
    ProductID INT PRIMARY KEY,
	ProductName TEXT  NOT NULL ,
	Unit VARCHAR(50)  NOT NULL ,
	Weight INT NOT NULL ,
	Size VARCHAR(50)  NOT NULL ,
	SupplierID INT  NOT NULL,
	CategoryID INT  NOT NULL,
	UnitPrice INT NOT NULL,
	UnitsInStock INT  NOT NULL ,
	Discontinued INT  NOT NULL ,
	ReorderLevel INT  NOT NULL, 
	FOREIGN KEY (SupplierID) REFERENCES CRMsystem.Supplier(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES CRMsystem.Category(CategoryID),
    FOREIGN KEY (ReorderLevel) REFERENCES CRMsystem.ReorderLevel(ReorderLevel)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE CRMsystem.Social_Campaign (
    CampaignID INT PRIMARY KEY,
    CampaignName TEXT NOT NULL,
    ChannelID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TAID INT NOT NULL,
    PromotionID INT NOT NULL,
    MKTExpense BIGINT NOT NULL,
    EmployeeID INT NOT NULL,
    Impressions BIGINT NOT NULL,
    Reach BIGINT NOT NULL,
    FOREIGN KEY (ChannelID) REFERENCES CRMsystem.Channel(ChannelID),
    FOREIGN KEY (TAID) REFERENCES CRMsystem.TargetAudience(TAID),
    FOREIGN KEY (EmployeeID) REFERENCES CRMsystem.Employee(EmployeeID),
    FOREIGN KEY (PromotionID) REFERENCES CRMsystem.Promotion(PromotionID)
    )
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;	




CREATE TABLE CRMsystem.MKTInteraction (
    InteractionID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    CampaignID INT NOT NULL,
    Datetime DATETIME NOT NULL ,
    ChannelID INT NOT NULL,
    isClick BIGINT,
    isShare BIGINT,
    isInbox INT,
    isOrder INT,
    FOREIGN KEY (ChannelID) REFERENCES CRMsystem.Channel(ChannelID),
    FOREIGN KEY (CustomerID) REFERENCES CRMsystem.Customer(CustomerID),
    FOREIGN KEY (CampaignID) REFERENCES CRMsystem.Social_Campaign(CampaignID)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE CRMsystem.SalesInteraction (
    SalesID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    Datetime DATETIME NOT NULL ,
    ChannelID INT NOT NULL,
    StatusID INT NOT NULL,
    DetailNote TEXT,
    FOREIGN KEY (ChannelID) REFERENCES CRMsystem.Channel(ChannelID),
    FOREIGN KEY (CustomerID) REFERENCES CRMsystem.Customer(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES CRMsystem.Employee(EmployeeID),
    FOREIGN KEY (StatusID) REFERENCES CRMsystem.SaleStatus(StatusID)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE CRMsystem.OrderDetail (
    OrderID INT PRIMARY KEY,
    Source INT NOT NULL,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL ,
    Price INT NOT NULL ,
    OrderDate DATE NOT NULL ,
    Discount INT ,
    PromotionID INT,
    RedemptionDate DATE,
    FOREIGN KEY (Source) REFERENCES CRMsystem.Channel(ChannelID),
    FOREIGN KEY (CustomerID) REFERENCES CRMsystem.Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES CRMsystem.Product(ProductID),
    FOREIGN KEY (PromotionID) REFERENCES CRMsystem.Promotion(PromotionID)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.Delivery (
    DeliveryID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    EmployeeID INT NOT NULL,
    DeliveryType VARCHAR(255) NOT NULL,
    PaymentType VARCHAR(255) NOT NULL,
    ShipperID INT NOT NULL,
    Address TEXT  NOT NULL,
    PostalCode INT  NOT NULL,
    PackageStatus VARCHAR(255)  NOT NULL,
    PartnerStatus VARCHAR(255)  NOT NULL,
	isCancelation INT ,
	Cancel_reason TEXT ,
	EstimatedDate DATE  NOT NULL ,
	IssueDate DATE  NOT NULL ,
	ActualDate DATE  NOT NULL ,
	ShippingFee INT  NOT NULL ,
	isReturn INT,
    FOREIGN KEY (OrderID) REFERENCES CRMsystem.OrderDetail(OrderID),
    FOREIGN KEY (EmployeeID) REFERENCES CRMsystem.Employee(EmployeeID),
    FOREIGN KEY (DeliveryType) REFERENCES CRMsystem.DeliveryType(DeliveryType),
    FOREIGN KEY (PaymentType) REFERENCES CRMsystem.Payment(PaymentType),
    FOREIGN KEY (ShipperID) REFERENCES CRMsystem.Shipper(ShipperID),
    FOREIGN KEY (PostalCode) REFERENCES CRMsystem.Location(PostalCode),
    FOREIGN KEY (PackageStatus) REFERENCES CRMsystem.Package(PackageStatus),
    FOREIGN KEY (PartnerStatus) REFERENCES CRMsystem.PartnerStatus(PartnerStatus)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE CRMsystem.Settlement (
    DeliveryID INT PRIMARY KEY,
	CashOnDelivery INT NOT NULL ,
	PrepaidByShop INT  NOT NULL ,
	ReturnFeePaidByShop INT,
	DeliveryFee INT NOT NULL ,
	InsuranceFee INT,
	ReturnFee INT,
	StorageFee INT NOT NULL ,
	AddressChangeFee INT ,
	InspectionFee INT,
	FOREIGN KEY (DeliveryID) REFERENCES CRMsystem.Delivery(DeliveryID)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;





