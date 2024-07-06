package com.tienda;

import com.tienda.dao.SucursalDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;



@SpringBootApplication
public class TiendaApplication  {

    @Autowired
    private SucursalDao sucursal;

    public static void main(String[] args) {
        SpringApplication.run(TiendaApplication.class, args);
    }

    
}
