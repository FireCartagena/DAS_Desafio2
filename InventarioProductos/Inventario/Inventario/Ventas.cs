//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Inventario
{
    using System;
    using System.Collections.Generic;
    
    public partial class Ventas
    {
        public int VentaID { get; set; }
        public int ProductoID { get; set; }
        public int CantidadVendida { get; set; }
        public decimal TotalVenta { get; set; }
        public System.DateTime FechaVenta { get; set; }
    
        public virtual Productos Productos { get; set; }
    }
}