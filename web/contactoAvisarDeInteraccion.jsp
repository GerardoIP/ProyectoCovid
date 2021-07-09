<%-- 
    Document   : contacto
    Created on : 30 jun. 2021, 17:11:54
    Author     : GPica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Estilos/contactoAvisar.css">
        <!--    IMPORTAR FUENTES     -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&display=swap" rel="stylesheet">
        <!--    IMPORTAR FIGURAS     -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>COVID-19</title>
    </head>
    <body>

        <div class="header">
            <!-- CONTENEDOR -->
            <div class="container">
                <!-- BARRA DE NAVEGACION -->
                <div class="navbar">
                    <!-- LOGO -->
                    <div class="logo">
                        <img src="Imagenes/UPIICSA.png" alt="UPIICSA" width="100px">
                    </div>
                    <!-- ELEMENTOS DEL NAVEGADOR -->
                    <nav>
                        <ul id="MenuItems">
                            <li><a href="index.jsp">INICIO</a></li>
                            <li><a href="">COVID</a></li>
                            <li><a href="">VACUNACIÓN COVID</a></li>
                            <li><a href="">TELÉFONOS DE CONTACTO</a></li>
                            <li><form action="cerrarSesion.jsp"><a href=""><i class="fa fa-sign-out"></i>CERRAR SESIÓN</a></form></li>
                        </ul>
                    </nav>
                </div> 
            </div>
        </div>

        <div class="form-container">
            <h2 class="title">DATOS PERSONALES</h2>
                <%
                    Connection c = null;
                    Statement s = null;
                    ResultSet r = null;
                    
                    Connection conexion = null;
                    Statement stament = null;
                    ResultSet rs;
                    String id = request.getParameter("Boleta");
            %>


            <%
                    
                    try{
                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://192.168.100.125/COVID", "wbench", "wbench"); 
                String query = "SELECT * FROM ComunidadInteraccion WHERE Identificador='" + id +"'";              
                stament = conexion.createStatement();
                rs = stament.executeQuery(query);
                if(rs.next()){
                    out.println("Identificador: "+rs.getString("Identificador") +"</br>");      
                    out.println("Nombre: "+rs.getString("Nombre") + " " + rs.getString("PApellido") + " " + rs.getString("SApellido") + "</br>");   
                    out.println("Correo Institucional: "+rs.getString("CorreoIns") +"</br>"); 
                    out.println("Correo Personal: "+rs.getString("CorreoPer") +"</br>"); 
                    out.println("Celular: "+rs.getString("Celular") +"</br>");   
                }else{
                    //out.println("<script>alert('No se encontraron registros')</script>");
                    return;
                }
            }catch(SQLException error){
                out.print(error.toString());
            }catch(Exception e){
                out.print("Excepcion: "+e);
            }
            %>
            
        </div>

        <h2 class="title">DATOS DE CONTACTO</h2>
        <div class="registros">            
            <%
                    try{
                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://192.168.100.125/COVID", "wbench", "wbench"); 
                String query = "SELECT * FROM ContactoAvisar WHERE IdentificadorRelacion='" + id +"'";              
                stament = conexion.createStatement();
                rs = stament.executeQuery(query);
                if(rs.next()){     
                    out.println("Nombre: "+rs.getString("Nombre") + " " + rs.getString("PApellido") + " " + rs.getString("SApellido") + "</br>");   
                    out.println("Correo Personal: "+rs.getString("CorreoPer") +"</br>"); 
                    out.println("Celular: "+rs.getString("Celular") +"</br>");  
                    out.println("Parentesco: "+rs.getString("Parentesco") +"</br>");
                }else{
                    //out.println("<script>alert('No se encontraron registros')</script>");
                    return;
                }
            }catch(SQLException error){
                out.print(error.toString());
            }catch(Exception e){
                out.print("Excepcion: "+e);
            }
            %>
        </div>

        <!-- FOOTER ------->

        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col-1">
                        <h3>DESCARGA LA APLICACIÓN</h3>
                        <div class="app-logo">
                            <img src="Imagenes//googleplay-app.png">
                            <img src="Imagenes//appstore-app.png">
                        </div>
                    </div>
                </div>
                <hr> <!-- SIRVE PARA PONER UNA LINEA HORIZONTAL -->
                <p class="copyright">© 2021 UPIICSA Todos los Derechos Reservados.</p>
            </div>
        </div>


    </body>
</html>
