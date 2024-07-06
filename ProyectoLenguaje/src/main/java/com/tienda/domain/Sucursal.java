package com.tienda.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.util.List;
import lombok.Data;
@Data
@Entity
@Table(name = "Sucursales")
public class Sucursal {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id_Sucursal")
    private Long Id_Sucursal; //Esto equivale en la DB como id_categoria, ya que en java se usa camelCase
    private String Nombre;
    private String Ubicacion;
    private String Telefono;

    @OneToMany
    @JoinColumn(name = "Id_Sucursal", insertable = false, updatable = false)
    List<Producto> productos;

    public Sucursal() {

    }

    public Sucursal(Long Id_Sucursal, String Nombre, String Ubicacion, String Telefono, List<Producto> productos) {
        this.Id_Sucursal = Id_Sucursal;
        this.Nombre = Nombre;
        this.Ubicacion = Ubicacion;
        this.Telefono = Telefono;
        this.productos = productos;
    }


    
    

    
}
