<!DOCTYPE html>
<html>
<head>
<%@ page import="java.sql.*,utils.*,models.*"%>
<%@ page import="modelsDAO.UserDAO"%>
<%
User activeUser = (User) request.getSession().getAttribute("user");

%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<% if (activeUser.getUserType().equals("02")) { %>
<link href="../styles/styleTutoria.css" rel="stylesheet">
<% } %>
<% if (activeUser.getUserType().equals("01")) { %>
<link href="../styles/styleReserva.css" rel="stylesheet">
<% } %>
<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Tutorías</title>
</head>

<% if (activeUser.getUserType().equals("01")) { %>
<body>
	<h1>RESERVAS DISPONIBLES</h1>

	<div id="reservas">
		<table>
			<tr>
				<th>Día</th>
				<th>Horario 17:00 - 18:00</th>
				<th>Horario 18:00 - 19:00</th>
				<th>Horario 19:00 - 20:00</th>
			</tr>
			<tr>
				<td>Lunes</td>
				<td>
					<div class="ocupado" data-id="Lunes 17:00-18:00"></div>
				</td>
				<td>
					<div class="libre" data-id="Lunes 18:00-19:00"></div>
				</td>
				<td>
					<div class="ocupado" data-id="Lunes 19:00-20:00"></div>
				</td>
			</tr>
			<tr>
				<td>Martes</td>
				<td>
					<div class="libre" data-id="Martes 17:00-18:00"></div>
				</td>
				<td>
					<div class="libre" data-id="Martes 18:00-19:00"></div>
				</td>
				<td>
					<div class="ocupado" data-id="Martes 19:00-20:00"></div>
				</td>
			</tr>
			<tr>
				<td>Miércoles</td>
				<td>
					<div class="libre" data-id="Miércoles 17:00-18:00"></div>
				</td>
				<td>
					<div class="libre" data-id="Miércoles 18:00-19:00"></div>
				</td>
				<td>
					<div class="ocupado" data-id="Miércoles 19:00-20:00"></div>
				</td>
			</tr>
			<tr>
				<td>Jueves</td>
				<td>
					<div class="libre" data-id="Jueves 17:00-18:00"></div>
				</td>
				<td>
					<div class="libre" data-id="Jueves 18:00-19:00"></div>
				</td>
				<td>
					<div class="ocupado" data-id="Jueves 19:00-20:00"></div>
				</td>
			</tr>
			<tr>
				<td>Viernes</td>
				<td>
					<div class="libre" data-id="Viernes 17:00-18:00"></div>
				</td>
				<td>
					<div class="libre" data-id="Viernes 18:00-19:00"></div>
				</td>
				<td>
					<div class="ocupado" data-id="Viernes 19:00-20:00"></div>
				</td>
			</tr>
		</table>
	</div>


	<div id="opciones">
		<a href="./tutoria.jsp" class="cancelar">Cancelar</a>
		<form action="" method="POST" id="confirmForm">
			<input type="hidden" name="selectedReserva" id="selectedReserva"
				value="">
			<button type="button" class="confirmar" onclick="confirmReserva()">Confirmar
				Reserva</button>
		</form>
	</div>
	<script src="../scripts/tutorias.js"></script>
</body>
<% } %>

<% if (activeUser.getUserType().equals("02")) { %>
<body>
	<h1>TUTORÍAS</h1>
	<div id="contenido">
		<div class="informacion">
			<h2>Asignatura</h2>
			<h2>Lugar de las tutorías</h2>
			<p>
				<strong>Horario:</strong> de lunes a viernes de 17:00 a 20:00
			</p>
		</div>

		<div class="tablaReservas">
			<table>
			<tr>
				<th>Día</th>
				<th>Horario 17:00 - 18:00</th>
				<th>Horario 18:00 - 19:00</th>
				<th>Horario 19:00 - 20:00</th>
			</tr>
			<tr>
				<td>Lunes</td>
				<td>
					<div class="ocupado" data-id="Lunes 17:00-18:00"></div>
				</td>
				<td>
					<div class="libre" data-id="Lunes 18:00-19:00"></div>
				</td>
				<td>
					<div class="ocupado" data-id="Lunes 19:00-20:00"></div>
				</td>
			</tr>
			<tr>
				<td>Martes</td>
				<td>
					<div class="libre" data-id="Martes 17:00-18:00"></div>
				</td>
				<td>
					<div class="libre" data-id="Martes 18:00-19:00"></div>
				</td>
				<td>
					<div class="ocupado" data-id="Martes 19:00-20:00"></div>
				</td>
			</tr>
			<tr>
				<td>Miércoles</td>
				<td>
					<div class="libre" data-id="Miércoles 17:00-18:00"></div>
				</td>
				<td>
					<div class="libre" data-id="Miércoles 18:00-19:00"></div>
				</td>
				<td>
					<div class="ocupado" data-id="Miércoles 19:00-20:00"></div>
				</td>
			</tr>
			<tr>
				<td>Jueves</td>
				<td>
					<div class="libre" data-id="Jueves 17:00-18:00"></div>
				</td>
				<td>
					<div class="libre" data-id="Jueves 18:00-19:00"></div>
				</td>
				<td>
					<div class="ocupado" data-id="Jueves 19:00-20:00"></div>
				</td>
			</tr>
			<tr>
				<td>Viernes</td>
				<td>
					<div class="libre" data-id="Viernes 17:00-18:00"></div>
				</td>
				<td>
					<div class="libre" data-id="Viernes 18:00-19:00"></div>
				</td>
				<td>
					<div class="ocupado" data-id="Viernes 19:00-20:00"></div>
				</td>
			</tr>
		</table>

			<div class="legend">
				<div>
					<span class="ocupado"></span> Ocupados
				</div>
				<div>
					<span class="libre"></span> Libres
				</div>
			</div>
		</div>
	</div>

	<script src="../scripts/tutorias.js"></script>
</body>
<% } %>
</html>