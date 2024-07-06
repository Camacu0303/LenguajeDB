
package com.tienda.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity
@Table(name="producto")
public class Producto implements Serializable{
     private static final long serialVersionUID = 1L;
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_producto")
    private Long idProducto; //Esto equivale en la DB como id_categoria, ya que en java se usa camelCase
    private String descripcion;
    private double precio;
    private String rutaImagen;
    private boolean activo;
    private int stock;
    //private Long idCategoria;
    
    @ManyToOne
    @JoinColumn(name = "id_categoria")
    Categoria categoria;
    
    
    public Producto(){
    
    }

    public Producto(Long idProducto, String descripcion, double precio, String rutaImagen, boolean activo, int stock, Categoria categoria) {
        this.idProducto = idProducto;
        this.descripcion = descripcion;
        this.precio = precio;
        this.rutaImagen = rutaImagen;
        this.activo = activo;
        this.stock = stock;
        this.categoria = categoria;
    }

    

   

    
    
    
}
