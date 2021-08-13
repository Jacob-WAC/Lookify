<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix = "c" uri =
"http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1" />
        <title>Insert title here</title>
        <link
            rel="stylesheet"
            href="/webjars/bootstrap/css/bootstrap.min.css"
        />
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="/dashboard">Lookify</a>
                <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div
                    class="collapse navbar-collapse"
                    id="navbarSupportedContent"
                >
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="/add">Add New</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Top Songs</a>
                        </li>
                    </ul>
                    <div>
                        <form action="/search/" method="post" class="d-flex">
                            <input
                                class="form-control me-2"
                                name="search"
                                type="search"
                                placeholder="Search"
                                aria-label="Search"
                            />
                            <button
                                class="btn btn-outline-success w-75"
                                type="submit"
                            >
                                Search Artists
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
        <h1>Top 10!</h1>
        <div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Rating</th>
                        <th scope="col">Name</th>
                        <th scope="col">Artist</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${Songs}" var="song" begin="0" end="9">
                        <tr>
                            <td><c:out value="${song.rating}" /></td>
                            <td><c:out value="${song.name}" /></td>
                            <td><c:out value="${song.artist}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
