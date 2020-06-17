using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using ABC_Company.Models;

namespace ABC_Company.Controllers
{
    public class TradesController : ApiController
    {
        private ABCCompanyEntities db = new ABCCompanyEntities();

        // GET: api/Trades
        public IQueryable<Trade> GetTrades()
        {
            return db.Trades;
        }        

        // POST: api/Trades
        [ResponseType(typeof(Trade))]
        public IHttpActionResult PostTrade(Trade trade)
        {
            db.Trades.Add(trade);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = trade.ID }, trade);
        }       

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }        
    }
}