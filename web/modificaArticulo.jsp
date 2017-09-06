<%-- 
    Document   : modificaArticulo
    Created on : 29-ago-2017, 23:17:08
    Author     : Mau
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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

  </head>
  <body>
    <% request.setCharacterEncoding("UTF-8"); %>
    <div class="container">
      <div class="row"></div>
      <div class="row">
        <div class="row col m3"></div>
        <div class="col m6 card-panel grey lighten-5">
          <h5 class="center">Modificaion de Articulos</h5>
          <form method="post" action="grabarArticulo.jsp">
            <div class="input-field blue-text">
              <i class="material-icons prefix">label_outline</i>
              <input type="number" name="codarticulo" id="codarticulo" value="<%=request.getParameter("codarticulo") %>" readonly>
              <label for="codarticulo">Código</label>
            </div>
            <div class="input-field">
              <i class="material-icons prefix">local_offer</i>
              <input type="text" name="nombre" id="nombre" value="<%=request.getParameter("nombre") %>" required>
              <label for="nombre">Nombre</label>
               <div class="input-field">
              <i class="material-icons prefix">local_offer</i>
              <input type="text" name="procodigo" id="procodigo" value="<%=request.getParameter("procodigo") %>" required>
              <label for="procodigo">Codigo  Proveedor</label>
            </div>
            </div>
               <div class="input-field">
              <i class="material-icons prefix">local_offer</i>
              <input type="text" name="catcodigo" id="catcodigo" value="<%=request.getParameter("catcodigo") %>" required>
              <label for="catcodigo">Codigo  Catergoria</label>
            </div>
            <div class="input-field">
              <i class="material-icons prefix">local_atm</i>
              <input type="text" name="precio" id="precio" value="<%=request.getParameter("precio") %>" required>
              <label for="precio">Precio</label>
            </div>
            <div class="input-field">
              <i class="material-icons prefix">assignment</i>
              <input type="text" name="stock" id="stock" value="<%=request.getParameter("stock") %>" required>
              <label for="stock">Stock</label>
            </div>
            <p class="center">
              <button class="btn waves-effect waves-light center" type="submit" name="aceptar">
              Aceptar
              <i class="mdi-action-check-circle"></i>
              </button>
              <a href="index.jsp" class="btn waves-effect waves-light center red">
              Cancelar
              <i class="fa fa-times"></i>
              </a>
            </p>
            <br>
          </form>
        </div>
      </div>
    </div>

    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <!-- Materialize -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>

  </body>
</html>
