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
                                New Search
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
        <h1><c:out value="${song.name}" /></h1>
        <p>Creator: <c:out value="${song.artist}" /></p>
        <p>Version: <c:out value="${song.rating}" /></p>
        <form action="/delete/${song.id}" method="post">
            <input type="hidden" name="_method" value="delete" />
            <input type="submit" value="Delete" />
        </form>
    </body>
</html>
