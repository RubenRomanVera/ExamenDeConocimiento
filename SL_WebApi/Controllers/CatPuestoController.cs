using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SL_WebApi.Controllers
{
    public class CatPuestoController : ApiController
    {
        [HttpGet]
        [Route("api/CatPuesto/GetAll")]
        public IHttpActionResult GetAll()
        {
            ML.Result result = BL.CatPuesto.GetAll();
            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return NotFound();
            }
        }
    }
}
