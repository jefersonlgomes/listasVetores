<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LISTAS E VETORES</title>
<style type="text/css">
.divTituloForm {
	
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
	width: 370px;
}
.divCampo {
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

.botaoEnviar{
	width: 150px;
}

.divSalvar {
	margin-top: 10px;
	width: 500px;
	text-align: right;
}
.divMsgErro {
	width: 500px;
	padding:5px;
	color: red;
	font-weight: bold;
	font-size: 14px;
	text-align: center;
}
</style>
</head>
<body>
	
	<form method="post" action="listasVetores">
		<div>
			<div class="divTituloForm">LISTAS E VETORES</div>
		</div>
		<div class="divForm">
			<div>
				<div class="divNomeCampo">Informe um número múltiplo de 10 entre 100 e 1000:</div>
				<div class="divCampo">
					<input type="text" class="campoFormulario" value=""	id="numeroEscolhido" name="numeroEscolhido" required="required" />
				</div>
			</div>			
			<div>
				<div class="divNomeCampo">Somatório das posições:</div>
				<div class="divCampo">
					<select  class="campoFormulario" name="posicaoSomatorio" id="posicaoSomatorio" required="required">
						<option value="">Selecione</option>
						<option value="Pares" >Pares</option>
						<option value="Impares">Impares</option>
					</select>
				</div>
			</div>			
			<div>
				<div class="divSalvar">
					<input type="submit" class="botaoEnviar" value="Enviar">
					<div></div>
				</div>
			</div>
		</div>
	</form>
		<div class="divMsgErro">
			${msgErro}
		</div>	
</body>
</html>