<%-- 
    Document   : cerrarSesion
    Created on : 29 jun. 2021, 20:11:46
    Author     : GPica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% HttpSession sesion = request.getSession();
        if(sesion!=null){
            sesion.invalidate();
            out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost/COVID7/index.jsp'/>");
        }
        %>
    </body>
</html>
