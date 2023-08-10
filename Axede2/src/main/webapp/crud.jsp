<%-- 
    Document   : crud
    Created on : 10/08/2023, 04:07:35 PM
    Author     : gamei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            // Configuración de la base de datos
            String jdbcURL = "jdbc:mysql://localhost:3305/hotel";
            String dbUser = "root";
            String dbPassword = "";

            // Establecer la conexión
            Connection conn = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                // Verificar el parámetro de acción
                String action = request.getParameter("action");

                if (action != null) {
                    switch (action) {
                        case "create":
                            String name = request.getParameter("nombre");
                            if (name != null) {
                                PreparedStatement createStmt = conn.prepareStatement("INSERT INTO reserva (name) VALUES (?)");
                                createStmt.setString(1, name);
                                createStmt.executeUpdate();
                            }
                            break;

                        case "read":
                            Statement readStmt = conn.createStatement();
                            ResultSet result = readStmt.executeQuery("SELECT * FROM reserva");
                            JSONArray itemsArray = new JSONArray();
                            while (result.next()) {
                                JSONObject item = new JSONObject();
                                item.put("id", result.getInt("id"));
                                item.put("name", result.getString("name"));
                                item.put("day", result.getString("reservation"));
                                itemsArray.put(item);
                            }
                            out.println(itemsArray.toString());
                            break;

                        // Agregar los casos para "update" y "delete" según sea necesario

                        default:
                            // Acción no válida
                            out.println("Invalid action");
                            break;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>

    </body>
</html>


</body>
</html>
