using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Inventario.Controllers
{
    public class BuscarProductosController : Controller
    {
        // GET: BuscarProductos
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Home");
        }

        public ActionResult ProductSearch()
        {
            return View();
        }

        public ActionResult ProductFilter()
        {
            return View();
        }
    }
}