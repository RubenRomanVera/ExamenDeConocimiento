using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SL_WebApi.Controllers
{
    public class EmpleadoController : ApiController
    {

        [HttpPost]
        [Route("api/Empleado/Add")]
        public IHttpActionResult Post([FromBody] ML.Empleado empleado)
        {
            var result = BL.Empleado.Add(empleado);
            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpPost]
        [Route("api/Empleado/Update")]
        public IHttpActionResult Put([FromBody] ML.Empleado empleado)
        {
            var result = BL.Empleado.Update(empleado);
            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpGet]
        [Route("api/Empleado/Delete")]
        public IHttpActionResult Delete(int Id_NumEmp)
        {
            ML.Empleado empleado = new ML.Empleado();
            empleado.Id_NumEmp = Id_NumEmp;
            var result = BL.Empleado.Delete(empleado.Id_NumEmp);
            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpGet]
        [Route("api/Empleado/GetAll")]
        public IHttpActionResult GetAll()
        {
            ML.Result result = BL.Empleado.GetAll();
            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpGet]
        [Route("api/Empleado/GetById")]
        public IHttpActionResult GetById(int Id_NumEmp)
        {
            var result = BL.Empleado.GetById(Id_NumEmp);
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
