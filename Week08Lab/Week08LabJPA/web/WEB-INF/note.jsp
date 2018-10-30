<%-- 
    Document   : note
    Created on : Oct 19, 2018, 4:20:24 PM
    Author     : 747787
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notes</title>
    </head>
    <body>
        <h1>Notes!</h1>
        ${errorMessage}
        <table>
            <tr>
                <th>Note ID</th>
                <th>Date Created</th>
                <th>Contents</th>
            </tr>
            <c:forEach var="note" items="${notes}">
                <tr>
                    <td>${note.noteID}</td>
                    <td>${note.dateCreated}</td>
                    <td>${note.contents}</td>
                    <td>
                        <form action="notes" method="post" >
                            <input type="submit" value="Delete">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="selectedNote" value="${note.noteID}">
                        </form>
                    </td>
                    <td>
                        <form action="notes" method="get">
                            <input type="submit" value="Edit">
                            <input type="hidden" name="action" value="view">
                            <input type="hidden" name="selectedNote" value="${note.noteID}">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    <c:if test="${selectedNote == null}">
        <h3>Add Note</h3>
        <form action="notes" method="POST">
            <input type="textarea" name="note"><br>

            <input type="hidden" name="action" value="add">
            <input type="submit" value="Save">
        </form>
    </c:if>
    <c:if test="${selectedNote != null}">
        <h3>Edit Note</h3>
        <form action="notes" method="POST">
            <input type="text" name="note" value="${selectedNote.contents}"><br>
            <input type="hidden" name="noteID" value="${selectedNote.noteID}">
            <input type="hidden" name="dateCreated" value="${selectedNote.dateCreated}">
            <input type="hidden" name="action" value="edit">
            <input type="submit" value="Save">
        </form>
    </c:if>
</body>
</html>
