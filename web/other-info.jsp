<%@page import="model.OtherInfoItem"%>
<%@page import="helpers.DatabaseUtils"%>

<%
    ViewUtils.setStylesheets(request, "estilos-panel-principal", "estilos-formularios");
    ViewUtils.setScripts(request, "form-slides", "formulario-etiquetas");
    
    //Inicializar variables 
    
    List<String> tagsDatalist = new ArrayList<String>();//RequestUtils.getEduTags(request);
    List<OtherInfoItem> otherList = OtherInfoItem.findBy("user_id", String.valueOf(RequestUtils.getSessionUserId(request)));
    
    List<String> tags = new ArrayList<String>();
    String tagInputNS ="New-exp";
    
    int i = 0;
    int n = 0;
%>

<%@include file="layout/upper.jsp" %>

<h1 class="page-header titulo text-center">Otra informaci�n</h1>

<a href="#new-item" class="btn btn-info new-item-btn btn-block">A�ade una nueva informaci�n</a>

<form class="form-hidden form-box" id="new-item" action="OtherInfo" method="POST">
    <h2 class="text-center">Nuevo �tem de otra informaci�n</h2>
    <div class="form-group">
        <div class="row">
            <div class="col-lg-4 form-field">
                <label>Nombre del �tem</label>
                <input class="form-control" name="title" type="text" placeholder="Nombre del �tem" required>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label>Descripci�n</label>
        <textarea name="description" class="form-control" rows="3" placeholder="Breve descripci�n..." class="form-control"></textarea>
    </div>

    <%@include file="templates/tag-input.jsp"%>
                        
    <input type="hidden" name="_action" value="insert">
    <div class="row text-center espaciador">
        <div class="col-lg-12">
            <input class="btn btn-success btn-block" type="submit" value="Guardar"/>
        </div>
    </div>
</form>

<!--Fin de formulario nuevo-->

<%if(otherList.isEmpty()){%>
    <h2>No tienes �tems de otra informaci�n</h2>
<%}else{%>
    <h2 class="text-center">Otra informaci�n a�adida</h2>
    <div class="container">
        <%for(OtherInfoItem other : otherList){
            int other_id = other.getId();
            tags = other.getTags();
            tagInputNS = "Edit-item-" + other.getId();
        %>
        <!--Importa la plantilla de item por cada iteraci�n y la rellena con los datos actuales-->
        <%@include file="templates/other_item.jsp"%>
            <!--fin-->
        <%}%>
    </div>
<%}%>
<!--Fin del item-->

<%@include file="layout/lower.jsp" %>
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
</script>

