# Cyber Threat Intelligence Database Web Application

This web application is designed for storing Cyber Threat Intelligence (CTI) data gathered from various honeypots. The application leverages ASP.NET Blazor for the front-end and Microsoft SQL Server as the database.

Disclaimer
--------------------------------
Warning
All the data (IP addresses, Countries, Honeypots, CVEs) in this repository are randomly generated. They are included for demonstration purposes only and do not reflect real data.


Technologies and Packages Used:
--------------------------------
- Framework: ASP.NET Blazor
- Database: Microsoft SQL Server
- Packages:
  - Radzen.Blazor
  - Microsoft.AspNetCore
  - Microsoft.EntityFrameworkCore

Prerequisites:
--------------
Before running the application, ensure you have the following installed:
- Microsoft SQL Server (e.g., SQL Server Management Studio 20)
- Visual Studio 2022
- .NET Core SDK
- SQL Server database setup

Getting Started:
----------------
To run the web application, follow these steps:

1. Create the Database:
   - Locate the `CTIDB3.sql` file in the project directory.
   - Open the file with SQL Server Management Studio (SSMS).
   - Execute the query to create the database.

2. Open the Solution File:
   - Import the project and open the `CyberThreatIntelDB3.sln` file using Visual Studio 2022.

3. Check Connection Strings:
   - Verify and update the database connection strings in the `appsettings.json` file to ensure they match your SQL Server configuration.

4. Review Data Access Layer:
   - Review the Entity Framework model (EDMX diagram) and data access configurations for correctness.

5. Verify Database Connection:
   - Confirm that the application successfully connects to the newly created database.

6. Run the Application:
   - Use Visual Studio to build and run the web application.
   - Open the application in your browser and start using it.

Features:
---------
- Centralized CTI Storage: Consolidate threat intelligence data from multiple honeypots.
- Intuitive Interface: Built with Blazor and enhanced with Radzen components for a user-friendly experience.
- Database Management: Seamless integration with SQL Server for data storage and retrieval.

## Screenshots

Below is an example screenshot illustrating the web application in use:

![Image](https://github.com/user-attachments/assets/c8e9ff42-0bcd-48c5-b027-1fc5cd9e8744)
![Image](https://github.com/user-attachments/assets/e0f84bba-138f-423e-a9c7-6bcc3eb11e8b)
![Image](https://github.com/user-attachments/assets/63a96892-ecb5-4195-8d9b-efbe1fe6c1f6)
![Image](https://github.com/user-attachments/assets/35f3dd69-9e1e-466c-b00b-ceb8e160c521)
![Image](https://github.com/user-attachments/assets/0890688c-b0fc-4b74-8d12-ec67ac9bd85c)

## Edmx Diagram:

![Image](https://github.com/user-attachments/assets/bdd2018b-c99c-4a72-8e26-e7755b25da6b)


Troubleshooting:
----------------
- If the database connection fails:
  - Double-check the connection string.
  - Ensure the SQL Server service is running.
- If any package dependencies are missing:
  - Restore NuGet packages in Visual Studio.

