<%-- 
    Document   : detalleArticulo
    Created on : 29-ago-2017, 23:16:25
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

    <title>Consulta Base de Datos</title>
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/produccion","root", "practicaphp");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");

      ResultSet listado = s.executeQuery ("SELECT * FROM articulo WHERE ArtCodigo='" + request.getParameter("codarticulo") +"'");

      listado.next();
    %>            
    <div class="container">
      <div class="row"></div>
      <div class="row">
        <div class="row col m3"></div>
        <div class="col m6 card-panel grey lighten-5">
          <h5 class="center"><%=listado.getString("ArtNombre") %></h5>
            <p>
              <i class="material-icons teal-text">label_outline</i> Código de Producto: 
              <b><%=listado.getString("ArtCodigo") %></b>
            </p>
            <p>
              <i class="material-icons teal-text">local_offer</i> Nombre: 
              <b><%=listado.getString("ArtNombre") %></b>
            </p>
            <p>
              <i class="material-icons teal-text">local_offer</i> Codigo de Proveedeor: 
              <b><%=listado.getString("ProCodigo") %></b>
            </p>
            <p>
              <i class="material-icons teal-text">local_offer</i> Codigo de Categoria: 
              <b><%=listado.getString("CatCodigo") %></b>
            </p>
            <p>
              <i class="material-icons teal-text">local_atm</i> Precio: 
              <b><%=listado.getString("ArtPrecio") %></b>
            </p>
            <p>
              <i class="material-icons teal-text">assignment</i> Stock: 
              <b><%=listado.getString("ArtStock") %></b>
            </p>           
            <br>
            <p class="center">
              <a href="index.jsp" class="btn waves-effect waves-light center">
                Aceptar
                <i class="material-icons">check_circle</i>
              </a>
            </p>
            <br>
          </form>
        </div>
      </div>
    </div>
    <% conexion.close(); %>

    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <!-- Materialize -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>

  </body>
</html>
