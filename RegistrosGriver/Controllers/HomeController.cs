using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dapper;
using RegistrosGriver.Models;

namespace RegistrosGriver.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListaClientes()
        {
            return View(Conexion.Lista<ClientesModel>("VerTodosLosClientes"));
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpGet]
        public ActionResult AgregarEditarCliente(int id = 0)
        {
            if (id == 0)
            {
                return View();
            }
            else
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@id_cliente", id);
                return View(Conexion.Lista<ClientesModel>("VerClientePorId", param).FirstOrDefault<ClientesModel>());
            }
        }

        [HttpPost]
        public ActionResult AgregarEditarCliente(ClientesModel clte)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@id_cliente", clte.Id_cliente);
            param.Add("@nombres", clte.Nombres);
            param.Add("@apellidos", clte.Apellidos);
            param.Add("@fecha_registro", clte.Fecha_registro);
            param.Add("@sexo", clte.Sexo);
            param.Add("@region", clte.Region);

            Conexion.Comandos("AgregarEditarCliente", param);
            return RedirectToAction("ListaClientes");
        }

        public ActionResult EliminarCliente(int id)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@id_cliente", id);
            Conexion.Comandos("BorrarClientePorId", param);
            return RedirectToAction("ListaClientes");
        }

        public ActionResult ListaContactos()
        {
            return View(Conexion.Lista<ContactoModel>("VerTodosLosContactos"));
        }

        [HttpGet]
        public ActionResult AgregarEditarContacto(int id = 0)
        {
            if (id == 0)
            {
                return View();
            }
            else
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@id_contacto", id);
                return View(Conexion.Lista<ContactoModel>("VerContactoPorId", param).FirstOrDefault<ContactoModel>());
            }
        }

        [HttpPost]
        public ActionResult AgregarEditarContacto(ContactoModel contm)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@id_contacto", contm.Id_contacto);
            param.Add("@nombres", contm.Nombres);
            param.Add("@apellidos", contm.Apellidos);
            param.Add("@numero_tel", contm.Numero_tel);

            Conexion.Comandos("AgregarEditarContacto", param);
            return RedirectToAction("ListaContactos");
        }

        public ActionResult EliminarContacto(int id)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@id_contacto", id);
            Conexion.Comandos("BorrarContactoPorId", param);
            return RedirectToAction("ListaContactos");
        }
    }
}