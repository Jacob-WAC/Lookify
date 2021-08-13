<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix = "c" uri =
"http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%>
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
        <div>
            <form:form action="/create" method="post" modelAttribute="song">
                <div>
                    <form:label path="name">name</form:label>
                    <form:errors path="name" />
                    <form:input path="name" />
                </div>
                <div>
                    <form:label path="artist">artist</form:label>
                    <form:errors path="artist" />
                    <form:input path="artist" />
                </div>
                <div>
                    <form:label path="rating">rating</form:label>
                    <form:select path="rating">
                        <form:option value="1" />
                        <form:option value="2" />
                        <form:option value="3" />
                        <form:option value="4" />
                        <form:option value="5" />
                        <form:option value="6" />
                        <form:option value="7" />
                        <form:option value="8" />
                        <form:option value="9" />
                        <form:option value="10" />
                    </form:select>
                </div>

                <input type="submit" value="Submit" />
            </form:form>
        </div>
    </body>
</html>
