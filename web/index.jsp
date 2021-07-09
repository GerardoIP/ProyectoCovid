<%-- 
    Document   : index
    Created on : 2 jul. 2021, 16:21:38
    Author     : GPica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"%>   
<!DOCTYPE html>
<html>
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Estilos/index.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!--    IMPORTAR FUENTES     -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&display=swap" rel="stylesheet">
        <!--        TARJETA-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!--    IMPORTAR FIGURAS     -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--  IMPORTAR CHART.JS PARA GRÁFICOS   -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>

        <title>COVID-19</title>
    </head>
    
    
    <body style="background-color: #e1d5d5">

        
        <!-- H E A D E R -->
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
                            <li><a class="a-header" href="Registrados.jsp">VACUNACIÓN</a></li>
                            <li><a class="a-header" href="">TELÉFONOS DE CONTACTO</a></li>
                            <li><form action="cerrarSesion.jsp"><a href="" class="a-header"><i class="fa fa-sign-out"></i>CERRAR SESIÓN</a></form></li>
                        </ul>
                    </nav>
                </div> 
            </div>
        </div>

        
        <!-- SE COMPRUEBA EL INICIO DE SESIÓN -->
        <%
    Connection conexion = null;
    Statement stament = null;
        %>
        
        <% //HttpSession sesion = request.getSession();
          
//    String correo = request.getParameter("correo");
//    String pass = request.getParameter("pass");
//    ResultSet rs;
//            
//    try{
//        Class.forName("com.mysql.jdbc.Driver");
//        conexion = DriverManager.getConnection("jdbc:mysql://localhost/COVID","gerardo1","n0m3l0"); 
//        String query = "SELECT * FROM Administrador WHERE Correo='" + correo +"' AND Contra='" + pass +"'";              
//        stament = conexion.createStatement();
//        rs = stament.executeQuery(query);
//        if(rs.next()){
////            out.println("<script>alert('HAZ INICIADO SESION, BIENVENIDO: " + rs.getString("Nombre")  +"')</script>");                   
//        }else{
//            out.println("<script>alert('No se encontraron registros')</script>");
//            response.sendRedirect("index.html");
//            return;
//        }
//    }catch(SQLException error){
//        out.print(error.toString());
//    }catch(Exception e){
//        out.print("Excepcion: "+e);
//    }
        %> 
        

        
        <!-- TARJETA CON NÚMERO DE CASOS -->
        
        <br><br><br>
        <div class="container">
            <div class="card" style="width:400px; float: left">
                <img class="card-img-top" src="Imagenes/card1.png" alt="Card image">
                <div class="card-body">
                    <div>
                        <%
                            ResultSet rse;
                            try {
                    conexion = DriverManager.getConnection("jdbc:mysql://192.168.100.125/COVID", "wbench", "wbench");
                    String query = "SELECT count(Identificador) FROM ComunidadPositivo";
                    String query2 = "SELECT count(Identificador) FROM ComunidadPositivo WHERE Revisado = '" + "No" + "'";
                    String query3 = "SELECT count(Identificador) FROM ComunidadPositivo WHERE Revisado = '" + "Si" + "'";
                    String query4 = "SELECT count(Identificador) FROM RegistrosComunidad";
                    Statement see = conexion.createStatement();
                    Statement see2 = conexion.createStatement();
                    Statement see3 = conexion.createStatement();
                    Statement see4 = conexion.createStatement();
                    ResultSet Cuantos = see.executeQuery(query);
                    ResultSet CuantosSinAtender = see2.executeQuery(query2);
                    ResultSet CuantosAtendidos = see3.executeQuery(query3);
                    ResultSet Comunidad = see4.executeQuery(query4);
                    if (Cuantos.next() && CuantosSinAtender.next() && CuantosAtendidos.next() && Comunidad.next()) {
                        int _cuantos = Integer.parseInt((Cuantos.getObject("count(Identificador)").toString()));
                        int _cuantosSinAtender = Integer.parseInt((CuantosSinAtender.getObject("count(Identificador)").toString()));
                        int _cuantosAtendidos = Integer.parseInt((CuantosAtendidos.getObject("count(Identificador)").toString()));
                        int _cuantosComunidad = Integer.parseInt((Comunidad.getObject("count(Identificador)").toString()));
                        out.println("<h6 class='card-title'>Comunidad registrada: " + _cuantosComunidad + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='Registrados.jsp'><i class='fa fa-users fa-2x' style='color: black'></i></a></h6>");
                        out.println("<h6 class='card-title'>Casos reportados: " + _cuantos + "</h6>");
                        out.println("<h6 class='card-title' style='color: red'>Casos sin atender: " + _cuantosSinAtender + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='casosSinAtender.jsp'><i class='fa fa-calendar-times-o fa-2x' style='color: black'></i></a></h6> ");
                        out.println("<h6 class='card-title' style='color: green'>Casos atendidos: &nbsp;&nbsp;" + _cuantosAtendidos + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='casosAtendidos.jsp'><i class='fa fa-calendar-check-o fa-2x' style='color: black'></i></a></h6> ");
                    } else {
                        return;
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
                        %>
                    </div>
                </div>
            </div>
                    
                    <!-- GRÁFICA -->        
                    
            <div class="grafica" style="width:600px; float: left; margin-left: 100px;">
                <div style="float: left; margin-left: 200px;">
                    <button style="color: #fff; background-color: darkblue" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Mes
                        <span class="caret"></span></button>
                    <ul class="dropdown-menu" style="background-color: #e1d5d5">
                        <li><a style="color: black" href="#">Enero</a></li>
                        <li><a style="color: black" href="#">Febrero</a></li>
                        <li><a style="color: black" href="#">Marzo</a></li>
                        <li><a style="color: black" href="#">Abril</a></li>
                        <li><a style="color: black" href="#">Mayo</a></li>
                        <li><a style="color: black" href="#">Junio</a></li>
                        <li><a style="color: black" href="#">Julio</a></li>
                        <li><a style="color: black" href="#">Agosto</a></li>
                        <li><a style="color: black" href="#">Septiembre</a></li>
                        <li><a style="color: black" href="#">Octubre</a></li>
                        <li><a style="color: black" href="#">Noviembre</a></li>
                        <li><a style="color: black" href="#">Diciembre</a></li>
                    </ul>
                </div>
                <div style="float: left; margin-left: 30px;">
                    <button style="color: #fff; background-color: darkblue" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Año
                        <span class="caret"></span></button>
                    <ul class="dropdown-menu" style="background-color: #e1d5d5">
                        <%
                            for(int i=2021; i<=2030; i++){
                                out.println("<li><a>" + i + "</a></li>");
                            }
                        %>
                    </ul>
                </div><br><br>
                <canvas id="myChart" width="25" height="15"></canvas>
                <script>
                    var ctx = document.getElementById("myChart").getContext("2d");
                    var myChart = new Chart(ctx, {
                        type: "line",
                        data: {
                            labels: ['Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                            datasets: [{
                                    label: 'CASOS REPORTADOS',
                                    data: [10, 9, 15, 50, 62],
                                    backgroundColor: [
                                        'rgb(0, 144, 255)'
                                    ]
                                }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                        ticks: {
                                            beginAtZero: true
                                        }
                                    }]
                            }
                        }
                    });
                </script>
            </div>
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
