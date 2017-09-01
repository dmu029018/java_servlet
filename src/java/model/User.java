package model;

import core.Database;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author DAVID
 */
public class User
{
    private int id;
    private String email, password;

    public User() {
        
    }

    public User(String email, String password) 
    {
        this.setEmail(email);
        this.setPassword(password);
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object e) 
    {
        return this.hashCode() == e.hashCode();
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 13 * hash + Objects.hashCode(this.email);
        hash = 13 * hash + Objects.hashCode(this.password);
        return hash;
    }

    public static List<User> findAll() 
    {
        List<User> list = new ArrayList<>();
        
        try {
            ResultSet rs = Database.getInstance().query("select `email`, `password` from `user`");
            
            while(rs.next())
            {
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                list.add(user);
            }
        } 
        catch (Exception ex) 
        {
            System.err.println("Error de conexión con la base de datos.");
        }
        
        return list;
    }
    
    /**
     * Comprueba si existe un usuario con el email de la instancia y su contraseña en la base de datos.
     * 
     * Se recomienda su uso para el login de usuario.
     * 
     * @return true si en la tabla `user` existe un registro con el mismo email y contraseña que el objeto que llama. De lo contrario, false.
     */
    public boolean authentication()
    {
        return User.findAll().stream().anyMatch(
            user -> this.equals(user)
        );
    }
    
    public boolean register()
    {
        int affected;
           
        try {
           
           affected = Database.getInstance().queryUpdate("insert into `user`(`email`, `password`) values (`"+ this.getEmail() +"`,`"+ this.getPassword() +"`)"); 
        } 
        catch (Exception ex) 
        {
            System.err.println("Error de conexión con la base de datos.");
            affected = 0;
        }
        
        return affected > 0;
    }
    
    /**
     * Comprueba si existe un usuario con el email de la instancia en la base de datos.
     * 
     * Se recomienda su uso para el registro de usuario.
     * 
     * @return true si en la tabla `user` existe un registro con el mismo email y contraseña que el objeto que llama. De lo contrario, false.
     */
    public boolean exists()
    {
        return User.findAll().stream().anyMatch( //Si una llamada da true el resultado devuelto es true.
            user -> this.getEmail().equals(user.getEmail()) //Para cada usuario, se compara el email de la instancia con él.
        );
    }
    
    public void fetchIdWithDatabase() throws Exception
    {
        try
        {
            ResultSet rs = Database.getInstance().query("select `id` from `user` where `email`='"+ this.getEmail()+"' and `password`='"+ this.getPassword()+"';");
            rs.next();
            this.id = rs.getInt("id");
        }
        catch(Exception ex)
        {
            this.id = 0;
        }
    }
}
