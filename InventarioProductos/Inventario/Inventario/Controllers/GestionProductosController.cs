using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using Inventario.Models;

namespace Inventario.Controllers
{
    public class GestionProductosController : Controller
    {
        private tienda_tecnologiaEntities db = new tienda_tecnologiaEntities();

        // GET: GestionProductos
        public ActionResult Index()
        {
            
            return RedirectToAction("Index", "Home");
        }

        public ActionResult CreateProduct()
        {
            ViewBag.Categorias = db.Categoria.ToList();

            return View();
        }

        public ActionResult ProductList()
        {

            var productos = db.Productos
                    .Include(p => p.Categoria)
                    .Select(p => new { ProductoID = p.ProductoID, Nombre = p.Nombre, Precio = p.Precio, CategoriaNombre = p.Categoria.NombreCategoria })
                    .ToList();
            ViewBag.Productos_Lista = productos;
            return View();
        }

        /** Gestion de productos **/       
        public ActionResult ProductEdit()
        {

            return View();
        }

        public ActionResult ProductDetail()
        {
            /*ViewBag.Productos = db.Productos
                .Include(p => p.Categoria)
                .Where(P => P.ProductoID == idProduct)
                .Select(p => new {
                    p.ProductoID,
                    p.Nombre,
                    p.Precio,
                    CategoriaNombre = p.Categoria.NombreCategoria
                }).FirstOrDefault();*/
            return View();
        }

        public ActionResult ProductDelete()
        {
            return View();
        }

    }
}