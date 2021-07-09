<%-- 
    Document   : cambioTabla
    Created on : 3 jul. 2021, 13:22:50
    Author     : GPica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"%> 
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        
        <%
        try {
            String id = request.getParameter("Boleta");  
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            ResultSet rs = null;
            Connection conexion = DriverManager.getConnection("jdbc:mysql://192.168.100.125/COVID", "wbench", "wbench");
            Statement comando = conexion.createStatement();
            comando.executeUpdate("UPDATE ComunidadPositivo SET Revisado = '" + "Si" + "', Fecha_Revisado = '" + dateFormat.format(date) + "' WHERE Revisado = 'No'"
            + "AND Identificador='" + id + "';");
            response.sendRedirect("casosSinAtender.jsp");
            conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        %>
        
    </body>
</html>
