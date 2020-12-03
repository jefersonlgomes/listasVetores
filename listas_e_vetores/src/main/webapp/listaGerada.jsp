<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LISTA DE NÚMEROS GERADA</title>
<style type="text/css">
.divTituloForm {
	margin-top: 5px;
	width: 500px;
	text-align: center;
	border: solid;
	border-color: silver;
	border-radius: 3px;
	font-weight: bold;
	font-size: 16px;
}

.divForm {
	margin-top: 5px;
	width: 500px;
	text-align: center;
	border: solid;
	border-color: silver;
	border-radius: 3px;
}

.divNomeCampo {
	padding: 5px;
	text-align: right;
	float: left;
	width: 350px;
}

.divCentro {
	padding: 5px;
	text-align: right;
	float: left;
}

.divCampo {
	font-weight: bold;
	padding: 5px;
	text-align: right;
	float: left;
}

.campoFormulario {
	padding: 5px;
	padding: 0px;
	margin: 0px;
	width: 100px;
}

.botaoNovaConsulta {
	width: 150px;
}

.divNovaConsulta {
	margin-top: 10px;
	width: 500px;
	text-align: right;
}

.numerosGerados {
	font-weight: bold;
	font-size: 16px;
	text-align: center;
}
</style>
</head>
<body>

	<form method="post" action="listasVetores">
		<div>
			<div class="divTituloForm">LISTAS E VETORES - RESULTADO</div>
		</div>
		<div>
			<div class="divTituloForm">
				Número informado: ${numeroEscolhido}				
			</div>
		</div>
		<div class="divTituloForm">
			<div>Número Gerados:</div>
			<div class="numerosGerados">
				<c:forEach items="${listaGerada}" var="numeroLista">
					${numeroLista}  
				</c:forEach>
			</div>
		</div>
		<div class="divTituloForm">
			<div>Somatório das posições ${posicaoSomatorio}: ${somatorio}
			</div>
		</div>
		<div class="divNovaConsulta">
			<a href="index.jsp"><input type="button"
				class="botaoNovaConsulta" value="Nova consulta"></a>
		</div>
	</form>
</body>
</html>