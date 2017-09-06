<%-- 
    Document   : index
    Created on : 29-ago-2017, 23:15:15
    Author     : Mau
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Materialize -->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <title>Categoria en un control “lista desplegable”</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/produccion", "root", "practicaphp");
            Statement s = conexion.createStatement();
            request.setCharacterEncoding("UTF-8");
            ResultSet listado = s.executeQuery("SELECT * FROM articulo");
        %>
        <div class="container">
            <div class="row"></div>
            <div class="row s12 m12 l12">
                <div class="card grey lighten-5">
                    <h3 class="center">Consultar Base de Datos</h3>
                    <br>
                    <div class="input-field col s6">
                        <form class="bordered centered" method="post" action="buscarArticulo.jsp">
                            <tr>
                                <td>
                                    <div class="input-field">
                                        <input type="text" name="nombre" id="buscaNombre">
                                        <label for="buscaNombre">Nombre de Articulo</label>
                                    </div>
                                </td>
                                <td>
                                    <button class="btn waves-effect waves-light center" type="submit" name="aceptar">
                                        <i class="fa fa-search"></i> Buscar
                                    </button>
                                </td>
                            </tr>
                        </form>
                    </div>       
                    <br>
                    <table class="striped">
                        <thead><th>Codigo de Articulo</th><th>Nombre</th><th>Precio de articulo</th><th></th><th></th></thead>
                            <%
                                while (listado.next()) {
                            %>
                        <tr>
                            <td><%=listado.getString("ArtCodigo")%></td>
                            <td><%=listado.getString("ArtNombre")%></td>
                            <td><%=listado.getString("ArtPrecio")%></td>
                        <form method="post" action="modificaArticulo.jsp">
                            <input type="hidden" name="codarticulo" value="<%=listado.getString("ArtCodigo")%>">
                            <input type="hidden" name="nombre" value="<%=listado.getString("ArtNombre")%>">
                            <input type="hidden" name="procodigo" value="<%=listado.getString("ProCodigo")%>">
                            <input type="hidden" name="catcodigo" value="<%=listado.getString("Catcodigo")%>"> 
                            <input type="hidden" name="precio" value="<%=listado.getString("ArtPrecio")%>"> 
                            <input type="hidden" name="stock" value="<%=listado.getString("ArtStock")%>">          
                            <td>
                                <button class="btn waves-effect waves-light center blue" type="submit" name="editar">
                                    Editar
                                </button>
                            </td>
                        </form>           
                        </tr>
                        <%
                            }
                        %>       
                    </table>  
                </div>
            </div>
        </div>
        <%
            conexion.close();
        %>
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <!-- Materialize -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
    </body>
</html>