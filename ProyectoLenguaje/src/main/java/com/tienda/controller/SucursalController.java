
package com.tienda.controller;

import com.tienda.domain.Sucursal;
import com.tienda.service.SucursaleService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

public class SucursalController {
    
    @Autowired
    SucursaleService sucursalService;
    @GetMapping("/listado")
    public String listado(Model model) {
        List<Sucursal> lista = sucursalService.getSucursals(false);
        //List<Categoria> lista= categoriaService.buscarPorDescripcion("Tarjeta Madre");
        model.addAttribute("sucursales", lista);
        model.addAttribute("totalSucursales",lista.size());
        return "/sucursales/listado";
    }
    
    
}