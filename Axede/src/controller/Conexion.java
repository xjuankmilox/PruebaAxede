package controller;

/**
 *
 * @author gamei
 */
public class Conexion {
    private String driver;
    private String url;
    private String usuario;
    private String contrasena;
    
    public Conexion() {
        this.driver="com.mysql.cj.jdbc.Driver";
        this.url="jdbc:mysql://localhost:3306/";
        this.usuario="root";
        this.contrasena="123456";
    }

    public String getDriver() {
        return driver;
    }

    public String getUrl() {
        return url;
    }

    public String getUsuario() {
        return usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    
}
