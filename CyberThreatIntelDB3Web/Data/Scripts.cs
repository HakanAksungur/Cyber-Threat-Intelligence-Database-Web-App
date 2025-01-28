using DataAccess;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace CyberThreatIntelDB3Web.Data
{
    public static class Scripts
    {
        public static async Task<List<T>> ListAsync<T>(CyberThreatIntelDB3WebContext context) where T : class
        {
            List<T> dbSetModels = await context.Set<T>().ToListAsync<T>();
            return dbSetModels;
        }

        public static async Task<List<T>> ListConditionAsync<T>(CyberThreatIntelDB3WebContext context, Expression<Func<T, bool>> condition) where T : class
        {
            List<T> dbSetModels = await context.Set<T>().Where(condition).ToListAsync<T>();
            return dbSetModels;
        }

        public static async Task<T> SingleAsync<T>(CyberThreatIntelDB3WebContext context, Expression<Func<T, bool>> condition) where T : class
        {
            return await context.Set<T>().SingleAsync<T>(condition);
        }

        public static T? Single<T>(CyberThreatIntelDB3WebContext context, Expression<Func<T, bool>> condition) where T : class
        {
            return context.Set<T>().Single<T>(condition);
        }
    }
}