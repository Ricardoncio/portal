<%@ page import="models.Internship" %>
<%@ page import="java.util.List" %>
<%@ page import="modelsDAO.SubjectDAO" %>
<%@ page import="models.User" %><%--
  Created by IntelliJ IDEA.
  User: albertoguzman
  Date: 29/5/24
  Time: 09:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User activeUser = (User) request.getSession().getAttribute("user");
    List<Internship> studentsInternshipInfo = null;
    if(activeUser != null) {
        studentsInternshipInfo = SubjectDAO.getStudentsInInternshipByMentorId(activeUser.getId());
    }
%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../styles/calificacionesAcc.css">
</head>
<body>
    <main id="mainInfo">
        <table>
            <thead>
            <tr>
                <th>Nombre Alumno</th>
                <th>Nota</th>
                <th>Opciones</th>
            </tr>
            </thead>
            <tbody>
            <% for(Internship i : studentsInternshipInfo) { %>
            <tr>
                <form id='form_<%= i.getStudent().getId() %>' action="../calAcc" method="post">
                    <td><%= i.getStudent().getName() %></td>
                    <td>
                        <input type="text" id="<%= i.getStudent().getId() %>" value="<%= i.getGrade() %>" name='input_<%= i.getStudent().getId() %>' disabled>
                        <input type="hidden" name="studentId" value="<%= i.getStudent().getId() %>">
                    </td>
                    <td>
                        <button type="button" id='edit_<%= i.getStudent().getId() %>' onclick="editGrade('<%= i.getStudent().getId() %>')">Edit</button>
                        <input type="submit" class="btnEnable" id='confirm_<%= i.getStudent().getId() %>' onclick="confirmEdit('<%= i.getStudent().getId() %>')" />
                        <button type="button" class="btnEnable" id='cancel_<%= i.getStudent().getId() %>' onclick="cancelEdit('<%= i.getStudent().getId() %>')">Cancelar</button>
                    </td>
                </form>
            </tr>
            <% } %>
            </tbody>
        </table>
    </main>

    <script src="../scripts/calificacionesAcc.js"></script>
</body>
</html>
