using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class CatPuesto
    {
        public static ML.Result GetAll()
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.ExamenDeConocimientoNetEntities context = new DL.ExamenDeConocimientoNetEntities())
                {
                    var query = context.CatPuestoGetAll().ToList();
                    result.Objects = new List<object>();
                    if (query != null)
                    {
                        foreach (var obj in query)
                        {
                            ML.CatPuesto catPuesto = new ML.CatPuesto();
                            catPuesto.IdCatPuesto = obj.IdCatPuesto;
                            catPuesto.NombrePuesto = obj.NombrePuesto;

                            result.Objects.Add(catPuesto);
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
    }
}
