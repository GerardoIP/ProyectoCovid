<%-- 
    Document   : casosSinAtender
    Created on : 2 jul. 2021, 18:26:00
    Author     : GPica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Estilos/casosSinAtender.css">
        <link rel="stylesheet" href="Estilos/inicioSesion.css">
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
                            <li><a class="a-header" href="index.jsp">INICIO</a></li>
                            <li><a class="a-header" href="" >COVID</a></li>
                            <li><a class="a-header" href="">VACUNACIÓN COVID</a></li>
                            <li><a class="a-header" href="">TELÉFONOS DE CONTACTO</a></li>
                            <!--                            <li><form action="cerrarSesion.jsp"><a href=""><i class="fa fa-sign-out"></i>CERRAR SESIÓN</a></form></li>-->
                        </ul>
                    </nav>
                </div> 
            </div>
        </div>

        <div class="registros">
            <h2 class="title" name="prueba">REGISTRADOS</h2>
            <!--            <div class="form-container">
                            <form class="formulario-sesion" name="datos" method="post">
                                <label for="fname" class="etiquetas">Identificador: </label>
                                <input type="text" id="fname" name="Boleta" class="campo-sesion" required><br>
                                <button formaction="contactoAvisar.jsp" type="submit" class="button" style="vertical-align:middle; float:left; margin-left: 35%"><span>Contacto </span></button>
                                <button formaction="interaccion.jsp" type="submit" class="button" style="vertical-align:middle; float:left"><span>Interacciones </span></button>
                                <button onclick="mensaje(this.form)" type="submit" class="button" style="vertical-align:middle; float:left"><span>Revisado </span></button><br><br>
                            </form>
                        </div>-->
            <table>

                <%
                Connection c = null;
                    Statement s = null;
                    ResultSet r = null;
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        c = DriverManager.getConnection("jdbc:mysql://192.168.100.125/COVID", "wbench", "wbench"); 
                        s = c.createStatement();
                        
                    }
                    catch(SQLException error)
                    {
                         out.print(error.toString());       
                    }
                %>


                <%
                    
                    try
                    {
                        r = s.executeQuery("SELECT * FROM RegistrosComunidad");
                        
                        out.println("<table id='miTabla' border='1' align=center>");
                    out.println("<tr>");
                                out.println("<td class='TitulosTabla'>"+"Identificador"+"</td>");
                                out.println("<td class='TitulosTabla'>"+"Nombre"+"</td>");
                                out.println("</tr>");
                    while(r.next())
                            {
                                String bo = r.getString("Identificador");
                                String no = r.getString("Nombre");
                                String pap = r.getString("PApellido");
                                String sap = r.getString("SApellido");
                                
                                out.println("<tr>");
                                out.println("<td>"+bo+"</td>");
                                out.println("<td>"+no+ " " + pap + " " + sap + "</td>");
                                out.println("</tr>");
                            }
                        out.println("</table>");
                    }
                    catch(SQLException error)
                    {
                         out.print(error.toString());
                    }
                %>
            </table>
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
