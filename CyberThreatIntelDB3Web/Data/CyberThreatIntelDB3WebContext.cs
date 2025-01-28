using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccess;

namespace CyberThreatIntelDB3Web.Data
{
    public class CyberThreatIntelDB3WebContext : DbContext
    {
        public CyberThreatIntelDB3WebContext (DbContextOptions<CyberThreatIntelDB3WebContext> options)
            : base(options)
        {
        }

        public DbSet<DataAccess.Honeypot> Honeypot { get; set; } = default!;
        public DbSet<DataAccess.Attacker> Attacker { get; set; } = default!;
        public DbSet<DataAccess.Vulnerability> Vulnerability { get; set; } = default!;
        public DbSet<DataAccess.Attack> Attack { get; set; } = default!;
        public DbSet<DataAccess.Malware> Malware { get; set; } = default!;
        public DbSet<DataAccess.IncidentReport> IncidentReport { get; set; } = default!;
    }
}
