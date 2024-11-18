using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Mvc;

namespace Inventario.Controllers
{
    public class InformesEstadisticasController : Controller
    {
        // GET: InformesEstadisticas
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Home");
        }

        public ActionResult ProductoInformes()
        {
            return View();
        }

        public ActionResult ProductoEstadistica()
        {
            return View();
        }
    }
}