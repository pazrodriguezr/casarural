<div class="table-responsive-xl">
    <table id="datos" class="table-view table-striped thead-light" style="width: 100%">
        <thead>
        <tr>
            <th></th>
            <th>Categoría</th>
            <th>Precio</th>
            <th>Habitaciones</th>
        </tr>
        </thead>
        <tbody>
        <g:each var="categoria" in="${categorias}">
            <tr>
                <td>
                    %{--<g:submitToRemote name="open${categoria.id}" id="open${categoria.id}"--}%
                                      %{--value="+" url="[action: 'showHabitacionesPerCategoria', id: categoria.id]"--}%
                                      %{--update="categoria${categoria.id}" class="btn btn-sm"/>--}%
                    <a href="#0" id="boton${categoria.id}" class="btn btn-sm">+</a>
                </td>
                <td>${categoria.descripcion}</td>
                <td><g:formatNumber number="${categoria.precio}" type="currency" currencyCode="EUR"/></td>
                <td>${categoria.habitaciones.size()}</td>
            </tr>
            <tr>
                <td colspan="4">
                    <div id="categoria${categoria.id}" style="display: none;">
                        <table>
                            <g:each var="habitacion" in="${categoria.habitaciones}">
                                <tr>
                                    <td><g:checkBox name="habitacion_${habitacion.id}"/></td>
                                    <td>${habitacion.descripcion}</td>
                                    <td>${habitacion.planta} planta</td>
                                </tr>
                            </g:each>
                        </table>
                    </div>
                </td>
            </tr>
            <g:javascript>
                $(document).ready(function(){
                    $("#boton${categoria.id}").click(function(){
                        $("#categoria${categoria.id}").slideToggle("slow");
                        if ($("#boton${categoria.id}").text() == "+"){
                            $("#boton${categoria.id}").html("-")
                        }else{
                            $("#boton${categoria.id}").text("+");
                        }
                    });
                });
            </g:javascript>
        </g:each>
        </tbody>
    </table>
</div>