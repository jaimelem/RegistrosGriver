using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RegistrosGriver.Models
{
    public class ClientesModel
    {
        public int Id_cliente {get; set;}
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Fecha_registro { get; set; }
        public char Sexo { get; set;}
        public string Region { get; set; }
    }
}