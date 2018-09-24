using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RegistrosGriver.Models
{
    public class ContactoModel
    {
        public int Id_contacto { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public int Numero_tel { get; set; }
    }
}