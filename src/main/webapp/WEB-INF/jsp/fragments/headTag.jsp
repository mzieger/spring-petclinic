<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!--
PetClinic :: a Spring Framework demonstration
-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>PetClinic :: a Spring Framework demonstration</title>


    <spring:url value="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" var="bootstrapCss"/>
    <link href="${bootstrapCss}" rel="stylesheet"/>

    <spring:url value="/resources/css/petclinic.css" var="petclinicCss"/>
    <link href="${petclinicCss}" rel="stylesheet"/>

    <spring:url value="/webjars/jquery/2.1.1/jquery.js" var="jQuery"/>
    <script src="${jQuery}"></script>

	<!-- jquery-ui.js file is really big so we only load what we need instead of loading everything -->
    <spring:url value="/webjars/jquery-ui/1.11.0/jquery-ui.js" var="jQueryUiCore"/>
    <script src="${jQueryUiCore}"></script>

    
    <spring:url value="/webjars/jquery-ui/1.11.0/jquery-ui.css" var="jQueryUiCss"/>
     <link href="${jQueryUiCss}" rel="stylesheet"></link>
</head>


