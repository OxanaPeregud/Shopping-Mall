<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="messages"/>

<html lang="${sessionScope.lang}">

<head>
    <title><fmt:message key="label.mall"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/table.css">
</head>

<body>

<%@include file="login-operations.jsp" %>
<button type="button" class="button"><a class="homepage" href="map"><fmt:message key="label.back"/></a></button>

<div>
    <h1><fmt:message key="label.app"/></h1>
</div>

<div>
    <h2>
        <a href="new-shop"><fmt:message key="label.newShop"/></a>
        &nbsp;&nbsp;&nbsp;
        <a href="list-shops"><fmt:message key="label.allShops"/></a>
    </h2>
</div>

<div>
    <form action="list-shops" method="post">
        <table id="customers">
            <caption><h2><fmt:message key="label.allShops"/></h2></caption>
            <tr>
                <th>ID</th>
                <th><fmt:message key="label.shopName"/></th>
                <th><fmt:message key="label.shopDescription"/></th>
                <th><fmt:message key="label.location"/></th>
                <th><fmt:message key="label.mobile"/></th>
                <th><fmt:message key="label.email"/></th>
            </tr>

            <c:forEach var="shop" items="${listShops}">
                <tr>
                    <td><c:out value="${shop.id}"/></td>
                    <td><c:out value="${shop.name}"/></td>
                    <td><c:out value="${shop.description}"/></td>
                    <td><c:out value="${shop.location}"/></td>
                    <td><c:out value="${shop.mobile}"/></td>
                    <td><c:out value="${shop.email}"/></td>
                    <td>
                        <a href="edit-shop?id=<c:out value='${shop.id}' />"><fmt:message key="label.edit"/></a>
                        &nbsp;&nbsp;&nbsp;&nbsp
                        <label><input type="checkbox" name="deleteShop"
                                      value="${shop.id}"><fmt:message key="label.delete"/></label>
                    </td>
                </tr>
            </c:forEach>

            <tr class="right">
                <td>
                    <input type="submit" value="<fmt:message key="label.delete"/>"/>
                </td>
            </tr>

        </table>
    </form>

    <p>
        <a href="${pageContext.request.contextPath}/choose-locale"><fmt:message key="label.changeLang"/></a>
    </p>

</div>
</body>
</html>
