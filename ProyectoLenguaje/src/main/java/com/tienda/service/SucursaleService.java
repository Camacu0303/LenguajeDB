
package com.tienda.service;

import com.tienda.domain.Sucursal;
import java.util.List;
public interface SucursaleService {
    // Se obtiene un listado de sucursals en un List
    public List<Sucursal> getSucursals(boolean activos);
    
   // Se obtiene un Sucursal, a partir del id de un sucursal
    public Sucursal getSucursal(Sucursal sucursal);
    
    // Se inserta un nuevo sucursal si el id del sucursal esta vacío
    // Se actualiza un sucursal si el id del sucursal NO esta vacío
    public void save(Sucursal sucursal);
    
    // Se elimina el sucursal que tiene el id pasado por parámetro
    public void delete(Sucursal sucursal);
    
   
}
