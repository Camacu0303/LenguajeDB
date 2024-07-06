
package com.tienda.dao;

import com.tienda.domain.Sucursal;
import org.springframework.data.jpa.repository.JpaRepository;


public interface SucursalDao extends JpaRepository<Sucursal, Long>{
    
}
