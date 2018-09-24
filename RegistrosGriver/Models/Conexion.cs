using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace RegistrosGriver.Models
{
    public static class Conexion
    {
        private static string conectar = @"Data Source=localhost\SQLEXPRESS;Database=usuarios;Trusted_Connection=True;";

        public static void Comandos(string proc, DynamicParameters param = null)
        {
            using (SqlConnection sqlcon = new SqlConnection(conectar))
            {
                sqlcon.Open();
                sqlcon.Execute(proc, param, commandType: CommandType.StoredProcedure);
            }
        }

        public static T Ejecutar<T>(string proc, DynamicParameters param = null)
        {
            using (SqlConnection sqlcon = new SqlConnection(conectar))
            {
                sqlcon.Open();
                return (T)Convert.ChangeType(sqlcon.Execute(proc, param, commandType: CommandType.StoredProcedure),typeof(T));
            }
        }

        public static IEnumerable<T> Lista<T>(string proc, DynamicParameters param = null)
        {
            using (SqlConnection sqlcon = new SqlConnection(conectar))
            {
                sqlcon.Open();
                return sqlcon.Query<T>(proc, param, commandType: CommandType.StoredProcedure);
            }
        }

    }

}