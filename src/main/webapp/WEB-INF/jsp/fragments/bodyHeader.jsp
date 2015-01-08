<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<spring:url value="/resources/images/ASR-Logo.png" var="logo"/>

<div style="width: 601px;">
        <div class="row" style="border-bottom: 4px solid #c9c9c9;">
            <div class="col-xs-4" style="padding-top: 10px"><span class="petclinic-header">Pet Clinic</span></div>
            <div class="col-xs-5" style="padding-top: 23px"><span class="A_Spring_Framework_Demonstration">A Spring Framework Demonstration</span></div>
            <div class="col-xs-* pull-right"><img src="${logo}"/></div>
        </div>
</div>

<div class="navbar" style="width: 601px;">
    <div class="row">
            <ul class="nav navbar-nav">
                <li style="width: 100px;"><a class='${homeClass}'  href="<spring:url value="/" htmlEscape="true" />"><span class="glyphicon glyphicon-home"></span>
                    &nbsp;Home</a></li>
                <li style="width: 130px;"><a class="nav-item" href="<spring:url value="/owners/find.html" htmlEscape="true" />"><span class="glyphicon glyphicon-search"></span>
                    &nbsp;Find owners</a></li>
                <li style="width: 140px;"><a class="nav-item" href="<spring:url value="/vets.html" htmlEscape="true" />"><span class="glyphicon glyphicon-list"></span>&nbsp;Veterinarians</a></li>
                <li style="width: 90px;"><a class="nav-item" href="<spring:url value="/oups.html" htmlEscape="true" />"
                                            title="trigger a RuntimeException to see how it is handled"><span class="glyphicon glyphicon-warning-sign"></span>&nbsp;Error</a></li>
                <li style="width: 80px;"><a class="nav-item"  href="#" title="not available yet. Work in progress!!"><span class="glyphicon glyphicon-question-sign"></span>&nbsp;Help</a></li>
            </ul>
     </div>
</div>
	
