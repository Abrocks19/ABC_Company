using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ABC_Company.Models;

namespace ABC_Company.Controllers
{
    public class ExportImportController : ApiController
    {
        // GET api/exportImport
        public IEnumerable<usp_GetDataByCountry_Result> Get()
        {
            using (ABCCompanyEntities objABCCompanyEntities = new ABCCompanyEntities())
            {
                List<usp_GetDataByCountry_Result> listExportImportData = objABCCompanyEntities.usp_GetDataByCountry().ToList();
                return listExportImportData;
            }           
        }        
    }
}
