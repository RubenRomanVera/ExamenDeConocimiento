using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Empleado
    {
        public static ML.Result Add(ML.Empleado empleado)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.ExamenDeConocimientoNetEntities context = new DL.ExamenDeConocimientoNetEntities())
                {
                    var query = context.EmpleadoAdd(empleado.Nombre,empleado.ApellidoPaterno,empleado.ApellidoMaterno,empleado.CatPuesto.IdCatPuesto);
                    if (query > 0)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.Message = ex.Message;
                result.Ex = ex;
            }
            return result;
        }

        public static ML.Result Update(ML.Empleado empleado)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.ExamenDeConocimientoNetEntities context = new DL.ExamenDeConocimientoNetEntities())
                {
                    var query = context.EmpleadoUpdate(empleado.Id_NumEmp,empleado.Nombre, empleado.ApellidoPaterno, empleado.ApellidoMaterno, empleado.CatPuesto.IdCatPuesto);
                    if (query > 0)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.Message = ex.Message;
                result.Ex = ex;
            }
            return result;
        }
        public static ML.Result Delete(int IdEmpleado)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.ExamenDeConocimientoNetEntities context = new DL.ExamenDeConocimientoNetEntities())
                {
                    var query = context.EmpleadoDelete(IdEmpleado);
                    if (query > 0)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.Message = ex.Message;
                result.Ex = ex;
            }
            return result;
        }
        public static ML.Result GetAll()
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.ExamenDeConocimientoNetEntities context = new DL.ExamenDeConocimientoNetEntities())
                {
                    var query = context.EmpleadoGetAll().ToList();
                    result.Objects = new List<object>();
                    if (query != null)
                    {
                        foreach (var obj in query)
                        {
                            ML.Empleado empleado = new ML.Empleado();
                            empleado.Id_NumEmp = obj.Id_NumEmp;
                            empleado.Nombre = obj.Nombre;
                            empleado.ApellidoPaterno = obj.ApellidoPaterno;
                            empleado.ApellidoMaterno = obj.ApellidoMaterno;

                            empleado.CatPuesto = new ML.CatPuesto();
                            empleado.CatPuesto.IdCatPuesto = obj.IdCatPuesto.Value;
                            empleado.CatPuesto.NombrePuesto = obj.NombrePuesto;

                            result.Objects.Add(empleado);
                        }
                        result.Correct = true;
                    }
                    else
                    {

                        result.Message = "No se encontraron registros.";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.Message = ex.Message;
                result.Ex = ex;
            }
            return result;
        }

        public static ML.Result GetById(int IdEmpleado)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.ExamenDeConocimientoNetEntities context = new DL.ExamenDeConocimientoNetEntities())
                {
                    var query = context.EmpleadoGetById(IdEmpleado).FirstOrDefault();
                    result.Object = new List<object>();
                    if (query != null)
                    {
                        ML.Empleado empleado = new ML.Empleado();
                        empleado.Id_NumEmp = query.Id_NumEmp;
                        empleado.Nombre = query.Nombre;
                        empleado.ApellidoPaterno = query.ApellidoPaterno;
                        empleado.ApellidoMaterno = query.ApellidoMaterno;

                        empleado.CatPuesto = new ML.CatPuesto();
                        empleado.CatPuesto.IdCatPuesto = query.IdCatPuesto.Value;
                        empleado.CatPuesto.NombrePuesto = query.NombrePuesto;

                        result.Object = empleado;
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.Message = "No se encontraron registros.";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.Message = ex.Message;
                result.Ex = ex;
            }
            return result;
        }

        
    }
}
