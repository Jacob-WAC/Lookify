<!-- prettier-ignore -->
<%@ page language="java" contentType="text/html charset=UTF-8" pageEncoding="UTF-8" %>
<!-- prettier-ignore -->
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- prettier-ignore -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- prettier-ignore -->

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
                            <a class="nav-link active" href="/topTen"
                                >Top Songs</a
                            >
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
        <h1>Songs!</h1>
        <div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Artist</th>
                        <th scope="col">Rating</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${Songs}" var="song">
                        <tr>
                            <td>
                                <a href="/show/${song.id}"
                                    ><c:out value="${song.name}"
                                /></a>
                            </td>
                            <td><c:out value="${song.artist}" /></td>
                            <td><c:out value="${song.rating}" /></td>
                            <td>
                                <form action="/delete/${song.id}" method="post">
                                    <input
                                        type="hidden"
                                        name="_method"
                                        value="delete"
                                    />
                                    <input type="submit" value="Delete" />
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
