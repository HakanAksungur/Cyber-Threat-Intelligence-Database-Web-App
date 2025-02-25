USE [master]
GO
/****** Object:  Database [CyberThreatIntelligenceDB3]    Script Date: 27.12.2024 20:36:30 ******/
CREATE DATABASE [CyberThreatIntelligenceDB3]
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CyberThreatIntelligenceDB3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET ARITHABORT OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET RECOVERY FULL 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET  MULTI_USER 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CyberThreatIntelligenceDB3', N'ON'
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET QUERY_STORE = ON
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CyberThreatIntelligenceDB3]
GO
/****** Object:  Table [dbo].[Attack]    Script Date: 27.12.2024 20:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attack](
	[AttackID] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Severity] [nvarchar](50) NOT NULL,
	[AttackType] [nvarchar](100) NOT NULL,
	[HoneypotID] [int] NOT NULL,
	[AttackerID] [int] NOT NULL,
	[VulnerabilityID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AttackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attacker]    Script Date: 27.12.2024 20:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attacker](
	[AttackerID] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [nvarchar](50) NOT NULL,
	[FirstSeen] [date] NOT NULL,
	[Country] [nvarchar](100) NULL,
	[LastActivity] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AttackerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Honeypot]    Script Date: 27.12.2024 20:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Honeypot](
	[HoneypotID] [int] IDENTITY(1,1) NOT NULL,
	[Location] [nvarchar](100) NOT NULL,
	[IPRange] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[ModifiedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[HoneypotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncidentReport]    Script Date: 27.12.2024 20:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncidentReport](
	[IncidentReportID] [int] IDENTITY(1,1) NOT NULL,
	[ReportDate] [date] NOT NULL,
	[ModifiedTime] [datetime] NULL,
	[Details] [nvarchar](max) NULL,
	[HoneypotID] [int] NOT NULL,
	[AttackID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IncidentReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Malware]    Script Date: 27.12.2024 20:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Malware](
	[MalwareID] [int] IDENTITY(1,1) NOT NULL,
	[Signature] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[AttackID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MalwareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vulnerability]    Script Date: 27.12.2024 20:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vulnerability](
	[VulnerabilityID] [int] IDENTITY(1,1) NOT NULL,
	[CVEIdentifier] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[SeverityLevel] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VulnerabilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Attack] ON 

INSERT [dbo].[Attack] ([AttackID], [Timestamp], [Severity], [AttackType], [HoneypotID], [AttackerID], [VulnerabilityID]) VALUES (1, CAST(N'2024-09-23T14:30:00.000' AS DateTime), N'High', N'XSS', 1, 1, 7)
INSERT [dbo].[Attack] ([AttackID], [Timestamp], [Severity], [AttackType], [HoneypotID], [AttackerID], [VulnerabilityID]) VALUES (2, CAST(N'2024-10-09T18:30:00.000' AS DateTime), N'Critical', N'RCE', 2, 2, 1)
INSERT [dbo].[Attack] ([AttackID], [Timestamp], [Severity], [AttackType], [HoneypotID], [AttackerID], [VulnerabilityID]) VALUES (3, CAST(N'2024-11-28T12:30:00.000' AS DateTime), N'High', N'SQL injection', 1, 3, 2)
INSERT [dbo].[Attack] ([AttackID], [Timestamp], [Severity], [AttackType], [HoneypotID], [AttackerID], [VulnerabilityID]) VALUES (4, CAST(N'2024-12-20T11:30:00.000' AS DateTime), N'Medium', N'DoS', 4, 4, 3)
INSERT [dbo].[Attack] ([AttackID], [Timestamp], [Severity], [AttackType], [HoneypotID], [AttackerID], [VulnerabilityID]) VALUES (5, CAST(N'2024-10-15T19:30:00.000' AS DateTime), N'Critical', N'Malware', 2, 5, 4)
INSERT [dbo].[Attack] ([AttackID], [Timestamp], [Severity], [AttackType], [HoneypotID], [AttackerID], [VulnerabilityID]) VALUES (6, CAST(N'2024-11-03T15:30:00.000' AS DateTime), N'Critical', N'Unauthorized access', 3, 6, 5)
INSERT [dbo].[Attack] ([AttackID], [Timestamp], [Severity], [AttackType], [HoneypotID], [AttackerID], [VulnerabilityID]) VALUES (7, CAST(N'2024-12-22T16:45:00.000' AS DateTime), N'Medium', N'Brute Force', 1, 7, 6)
INSERT [dbo].[Attack] ([AttackID], [Timestamp], [Severity], [AttackType], [HoneypotID], [AttackerID], [VulnerabilityID]) VALUES (8, CAST(N'2024-09-22T11:53:51.000' AS DateTime), N'Critical', N'Malware', 2, 8, 4)
INSERT [dbo].[Attack] ([AttackID], [Timestamp], [Severity], [AttackType], [HoneypotID], [AttackerID], [VulnerabilityID]) VALUES (9, CAST(N'2024-03-10T09:14:51.000' AS DateTime), N'Critical', N'Malware', 2, 9, 4)
INSERT [dbo].[Attack] ([AttackID], [Timestamp], [Severity], [AttackType], [HoneypotID], [AttackerID], [VulnerabilityID]) VALUES (10, CAST(N'2024-10-05T03:16:51.000' AS DateTime), N'High', N'CSRF', 1, 10, 7)
INSERT [dbo].[Attack] ([AttackID], [Timestamp], [Severity], [AttackType], [HoneypotID], [AttackerID], [VulnerabilityID]) VALUES (11, CAST(N'2024-01-15T02:44:51.000' AS DateTime), N'High', N'SSRF', 1, 11, 8)
INSERT [dbo].[Attack] ([AttackID], [Timestamp], [Severity], [AttackType], [HoneypotID], [AttackerID], [VulnerabilityID]) VALUES (12, CAST(N'2023-12-28T19:07:51.000' AS DateTime), N'High', N'Cookie Poisoning', 4, 12, 9)
INSERT [dbo].[Attack] ([AttackID], [Timestamp], [Severity], [AttackType], [HoneypotID], [AttackerID], [VulnerabilityID]) VALUES (13, CAST(N'2024-09-24T13:32:51.000' AS DateTime), N'Low', N'Phishing Mail', 2, 13, 10)
SET IDENTITY_INSERT [dbo].[Attack] OFF
GO
SET IDENTITY_INSERT [dbo].[Attacker] ON 

INSERT [dbo].[Attacker] ([AttackerID], [IPAddress], [FirstSeen], [Country], [LastActivity]) VALUES (1, N'185.104.50.152', CAST(N'2024-08-29' AS Date), N'Russia', CAST(N'2024-09-23T14:30:00.000' AS DateTime))
INSERT [dbo].[Attacker] ([AttackerID], [IPAddress], [FirstSeen], [Country], [LastActivity]) VALUES (2, N'115.69.182.156', CAST(N'2024-10-06' AS Date), N'Russia', CAST(N'2024-10-09T18:30:00.000' AS DateTime))
INSERT [dbo].[Attacker] ([AttackerID], [IPAddress], [FirstSeen], [Country], [LastActivity]) VALUES (3, N'133.163.248.186', CAST(N'2024-11-27' AS Date), N'Russia', CAST(N'2024-11-28T12:30:00.000' AS DateTime))
INSERT [dbo].[Attacker] ([AttackerID], [IPAddress], [FirstSeen], [Country], [LastActivity]) VALUES (4, N'56.79.212.186', CAST(N'2024-12-19' AS Date), N'China', CAST(N'2024-12-20T11:30:00.000' AS DateTime))
INSERT [dbo].[Attacker] ([AttackerID], [IPAddress], [FirstSeen], [Country], [LastActivity]) VALUES (5, N'24.14.230.0', CAST(N'2024-09-19' AS Date), N'China', CAST(N'2024-12-20T11:30:00.000' AS DateTime))
INSERT [dbo].[Attacker] ([AttackerID], [IPAddress], [FirstSeen], [Country], [LastActivity]) VALUES (6, N'181.222.237.235', CAST(N'2024-10-10' AS Date), N'USA', CAST(N'2024-10-15T19:30:00.000' AS DateTime))
INSERT [dbo].[Attacker] ([AttackerID], [IPAddress], [FirstSeen], [Country], [LastActivity]) VALUES (7, N'233.222.243.205', CAST(N'2024-12-09' AS Date), N'USA', CAST(N'2024-11-03T15:30:00.000' AS DateTime))
INSERT [dbo].[Attacker] ([AttackerID], [IPAddress], [FirstSeen], [Country], [LastActivity]) VALUES (8, N'91.39.117.103', CAST(N'2024-09-21' AS Date), N'Turkey', CAST(N'2024-09-22T11:53:51.000' AS DateTime))
INSERT [dbo].[Attacker] ([AttackerID], [IPAddress], [FirstSeen], [Country], [LastActivity]) VALUES (9, N'225.17.195.143', CAST(N'2024-02-25' AS Date), N'Turkey', CAST(N'2024-12-22T16:45:00.000' AS DateTime))
INSERT [dbo].[Attacker] ([AttackerID], [IPAddress], [FirstSeen], [Country], [LastActivity]) VALUES (10, N'138.195.142.217', CAST(N'2024-09-22' AS Date), N'France', CAST(N'2024-09-24T13:32:51.000' AS DateTime))
INSERT [dbo].[Attacker] ([AttackerID], [IPAddress], [FirstSeen], [Country], [LastActivity]) VALUES (11, N'105.14.67.57', CAST(N'2023-12-23' AS Date), N'Iran', CAST(N'2023-12-28T19:07:51.000' AS DateTime))
INSERT [dbo].[Attacker] ([AttackerID], [IPAddress], [FirstSeen], [Country], [LastActivity]) VALUES (12, N'247.39.162.57', CAST(N'2023-12-22' AS Date), N'Iran', CAST(N'2024-10-05T03:16:51.000' AS DateTime))
INSERT [dbo].[Attacker] ([AttackerID], [IPAddress], [FirstSeen], [Country], [LastActivity]) VALUES (13, N'15.69.82.126', CAST(N'2024-01-04' AS Date), N'Pakistan', CAST(N'2024-03-10T09:14:51.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Attacker] OFF
GO
SET IDENTITY_INSERT [dbo].[Honeypot] ON 

INSERT [dbo].[Honeypot] ([HoneypotID], [Location], [IPRange], [Status], [ModifiedTime]) VALUES (1, N'Web Applications', N'175.45.25.0/24', N'Active', CAST(N'2024-12-20T14:30:00.000' AS DateTime))
INSERT [dbo].[Honeypot] ([HoneypotID], [Location], [IPRange], [Status], [ModifiedTime]) VALUES (2, N'Customer Endpoints', N'192.168.1.0/24', N'Active', CAST(N'2024-12-21T10:00:00.000' AS DateTime))
INSERT [dbo].[Honeypot] ([HoneypotID], [Location], [IPRange], [Status], [ModifiedTime]) VALUES (3, N'API Services', N'216.34.67.0/24', N'Active', CAST(N'2024-12-21T20:00:00.000' AS DateTime))
INSERT [dbo].[Honeypot] ([HoneypotID], [Location], [IPRange], [Status], [ModifiedTime]) VALUES (4, N'Cloud System', N'45.23.89.54', N'Active', CAST(N'2024-12-19T18:50:00.000' AS DateTime))
INSERT [dbo].[Honeypot] ([HoneypotID], [Location], [IPRange], [Status], [ModifiedTime]) VALUES (5, N'Mobile Application (IOS)', N'32.45.223.45', N'Inactive', CAST(N'2024-11-19T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Honeypot] OFF
GO
SET IDENTITY_INSERT [dbo].[IncidentReport] ON 

INSERT [dbo].[IncidentReport] ([IncidentReportID], [ReportDate], [ModifiedTime], [Details], [HoneypotID], [AttackID]) VALUES (1, CAST(N'2024-09-23' AS Date), CAST(N'2024-09-23T14:30:00.000' AS DateTime), N'XSS Attack on Web App Honeypot', 1, 1)
INSERT [dbo].[IncidentReport] ([IncidentReportID], [ReportDate], [ModifiedTime], [Details], [HoneypotID], [AttackID]) VALUES (2, CAST(N'2024-10-09' AS Date), CAST(N'2024-10-09T18:30:00.000' AS DateTime), N'Remote Code Execution (RCE) Detected on Customer Endpoint Honeypot', 2, 2)
INSERT [dbo].[IncidentReport] ([IncidentReportID], [ReportDate], [ModifiedTime], [Details], [HoneypotID], [AttackID]) VALUES (3, CAST(N'2024-10-15' AS Date), CAST(N'2024-10-15T19:30:00.000' AS DateTime), N'Malware Detected on Customer Endpoint Honeypot', 2, 5)
INSERT [dbo].[IncidentReport] ([IncidentReportID], [ReportDate], [ModifiedTime], [Details], [HoneypotID], [AttackID]) VALUES (4, CAST(N'2024-11-03' AS Date), CAST(N'2024-11-03T15:30:00.000' AS DateTime), N'Unauthorized access to API Service Honeypot', 3, 6)
INSERT [dbo].[IncidentReport] ([IncidentReportID], [ReportDate], [ModifiedTime], [Details], [HoneypotID], [AttackID]) VALUES (5, CAST(N'2024-11-28' AS Date), CAST(N'2024-11-28T12:30:00.000' AS DateTime), N'SQL injection attempt on Web App Honeypot', 1, 3)
INSERT [dbo].[IncidentReport] ([IncidentReportID], [ReportDate], [ModifiedTime], [Details], [HoneypotID], [AttackID]) VALUES (6, CAST(N'2024-12-20' AS Date), CAST(N'2024-12-20T11:30:00.000' AS DateTime), N'DoS attack on Cloud System', 4, 4)
SET IDENTITY_INSERT [dbo].[IncidentReport] OFF
GO
SET IDENTITY_INSERT [dbo].[Malware] ON 

INSERT [dbo].[Malware] ([MalwareID], [Signature], [Type], [Name], [AttackID]) VALUES (1, N'5d41402abc4b2a76b9719d911017c592', N'Trojan', N'Emotet', 5)
INSERT [dbo].[Malware] ([MalwareID], [Signature], [Type], [Name], [AttackID]) VALUES (2, N'e99a18c428cb38d5f260853678922e03', N'Ransomware', N'WannaCry', 8)
INSERT [dbo].[Malware] ([MalwareID], [Signature], [Type], [Name], [AttackID]) VALUES (3, N'098f6bcd4621d373cade4e832627b4f6', N'Stealer', N'RedLine Stealer', 9)
SET IDENTITY_INSERT [dbo].[Malware] OFF
GO
SET IDENTITY_INSERT [dbo].[Vulnerability] ON 

INSERT [dbo].[Vulnerability] ([VulnerabilityID], [CVEIdentifier], [Description], [SeverityLevel]) VALUES (1, N'CVE-2021-44228', N'Log4j vulnerability allowing remote code execution.', N'Critical')
INSERT [dbo].[Vulnerability] ([VulnerabilityID], [CVEIdentifier], [Description], [SeverityLevel]) VALUES (2, N'CVE-2023-00123', N'SQL injection due to non parameterized database queries.', N'High')
INSERT [dbo].[Vulnerability] ([VulnerabilityID], [CVEIdentifier], [Description], [SeverityLevel]) VALUES (3, N'CVE-2016-1238', N'Lack of rate limiting leads to denial of service (DoS) attacks.', N'Medium')
INSERT [dbo].[Vulnerability] ([VulnerabilityID], [CVEIdentifier], [Description], [SeverityLevel]) VALUES (4, N'CVE-2020-1472', N'Malware exploiting unpatched vulnerabilities in legacy software.', N'Critical')
INSERT [dbo].[Vulnerability] ([VulnerabilityID], [CVEIdentifier], [Description], [SeverityLevel]) VALUES (5, N'CVE-2017-0144', N'Unauthorized access via default credentials on API Service.', N'Critical')
INSERT [dbo].[Vulnerability] ([VulnerabilityID], [CVEIdentifier], [Description], [SeverityLevel]) VALUES (6, N'CVE-2018-1111', N'Brute force attacks bypassing account lockout mechanisms.', N'Medium')
INSERT [dbo].[Vulnerability] ([VulnerabilityID], [CVEIdentifier], [Description], [SeverityLevel]) VALUES (7, N'CVE-2014-1521', N'Cross-Site Request Forgery (CSRF) vulnerability due to missing tokens.', N'High')
INSERT [dbo].[Vulnerability] ([VulnerabilityID], [CVEIdentifier], [Description], [SeverityLevel]) VALUES (8, N'CVE-2021-3129', N'Server-Side Request Forgery (SSRF) exploiting unvalidated URL parameters.', N'High')
INSERT [dbo].[Vulnerability] ([VulnerabilityID], [CVEIdentifier], [Description], [SeverityLevel]) VALUES (9, N'CVE-2015-2080', N'Cookie poisoning due to lack of cryptographic integrity checks.', N'High')
INSERT [dbo].[Vulnerability] ([VulnerabilityID], [CVEIdentifier], [Description], [SeverityLevel]) VALUES (10, N'CVE-2021-34527', N'Phishing mail exploiting social engineering techniques.', N'Low')
SET IDENTITY_INSERT [dbo].[Vulnerability] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Attacker__F0C25BE0C5EC86E5]    Script Date: 27.12.2024 20:36:31 ******/
ALTER TABLE [dbo].[Attacker] ADD UNIQUE NONCLUSTERED 
(
	[IPAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Vulnerab__CC2DC69F0D2A5A34]    Script Date: 27.12.2024 20:36:31 ******/
ALTER TABLE [dbo].[Vulnerability] ADD UNIQUE NONCLUSTERED 
(
	[CVEIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attack]  WITH CHECK ADD FOREIGN KEY([AttackerID])
REFERENCES [dbo].[Attacker] ([AttackerID])
GO
ALTER TABLE [dbo].[Attack]  WITH CHECK ADD FOREIGN KEY([HoneypotID])
REFERENCES [dbo].[Honeypot] ([HoneypotID])
GO
ALTER TABLE [dbo].[Attack]  WITH CHECK ADD FOREIGN KEY([VulnerabilityID])
REFERENCES [dbo].[Vulnerability] ([VulnerabilityID])
GO
ALTER TABLE [dbo].[IncidentReport]  WITH CHECK ADD FOREIGN KEY([AttackID])
REFERENCES [dbo].[Attack] ([AttackID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IncidentReport]  WITH CHECK ADD FOREIGN KEY([HoneypotID])
REFERENCES [dbo].[Honeypot] ([HoneypotID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Malware]  WITH CHECK ADD FOREIGN KEY([AttackID])
REFERENCES [dbo].[Attack] ([AttackID])
GO
ALTER TABLE [dbo].[Attack]  WITH CHECK ADD CHECK  (([Severity]='Critical' OR [Severity]='High' OR [Severity]='Medium' OR [Severity]='Low'))
GO
ALTER TABLE [dbo].[Vulnerability]  WITH CHECK ADD CHECK  (([SeverityLevel]='Critical' OR [SeverityLevel]='High' OR [SeverityLevel]='Medium' OR [SeverityLevel]='Low'))
GO
USE [master]
GO
ALTER DATABASE [CyberThreatIntelligenceDB3] SET  READ_WRITE 
GO
