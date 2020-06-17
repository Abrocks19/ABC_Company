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
using System.Web.Mvc;
using ABC_Company.Models;

namespace ABC_Company.Controllers
{
    public class CompanyController : ApiController
    {
        private ABCCompanyEntities db = new ABCCompanyEntities();

        // GET: api/Company
        public IQueryable<Company> GetCompany()
        {
            return db.Companies;
        }        

        // POST: api/Company
        [ResponseType(typeof(Company))]
        public IHttpActionResult PostCompany(Company company)
        {
            if (!CompanyExists(company.Name))
            {
                db.Companies.Add(company);
                db.SaveChanges();
                return CreatedAtRoute("DefaultApi", new { id = company.Id }, company);
            }
            else
            {
                return BadRequest("Company already exists");
            }
        }        
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CompanyExists(string name)
        {
            return db.Companies.Count(e => e.Name == name) > 0;
        }
    }
}