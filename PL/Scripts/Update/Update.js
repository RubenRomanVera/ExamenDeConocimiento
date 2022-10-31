$(document).ready(function () {
    GetAll();
    CatPuestoGetAll();
});

function GetAll() {
    $.ajax({
        type: 'GET',
        url: 'http://localhost:56759/api/Empleado/GetAll',
        success: function (result) {
            $('#tblEmpleado tbody').empty();
            $.each(result.Objects, function (i, empleado) {
                var filas =
                    '<tr>'
                    + '<td class="text-center"><button class="btn btn-warning" onclick="GetById(' + empleado.Id_NumEmp + ')"><span class="glyphicon glyphicon-pencil"></span></button></td>'
                    + "<td id='id' class='hidden'>" + empleado.Id_NumEmp + "</td>"
                    + "<td class='text-center'>" + empleado.Nombre + "</td>"
                    + "<td class='text-center'>" + empleado.ApellidoPaterno + "</td>"
                    + "<td class='text-center'>" + empleado.ApellidoMaterno + "</td>"
                    + "<td class='text-center'>" + empleado.CatPuesto.NombrePuesto + "</td>"
                    + '<td class="text-center"><button class="btn btn-danger" onclick="Eliminar(' + empleado.Id_NumEmp + ')"><span class="glyphicon glyphicon-trash" style="color:#FFFFFF"></span></button></td>'
                    + "</tr>";
                $("#tblEmpleado tbody").append(filas);

            });
        },
        error: function (result) {
        }
    });
};

function CatPuestoGetAll() {
    $.ajax({
        type: 'GET',
        url: 'http://localhost:56759/api/CatPuesto/GetAll',
        success: function (result) {
            $("#ddlCatPuestos").append('<option value="' + 0 + '">' + 'Seleccione una opción' + '</option>');
            $.each(result.Objects, function (i, catPuesto) {
                $("#ddlCatPuestos").append('<option value="'
                    + catPuesto.IdCatPuesto + '">'
                    + catPuesto.NombrePuesto + '</option>');
            });
        },
        error: function (result) {
            alert('Error en la consulta.' + result.responseJSON.ErrorMessage);

        }
    });
}

function Add(empleado) {
    var empleado = {
        Id_NumEmp: 0,
        Nombre: $('#txtNombre').val(),
        ApellidoPaterno: $('#txtApellidoPaterno').val(),
        ApellidoMaterno: $('#txtApellidoMaterno').val(),
        CatPuesto: {
            IdCatPuesto: $('#ddlCatPuestos').val()
        }
    }
    $.ajax({
        type: 'POST',
        url: 'http://localhost:56759/api/Empleado/Add',
        dataType: 'json',
        data: empleado,
        success: function (result) {
            $('#myModal').modal();
            $('#ModalUpdate').modal('hide')
            GetAll();
        },
        error: function (result) {
            alert('Ocurrio un error.' + result.responseJSON.ErrorMessage);
        }
    });
};

function Update(empleado) {
    var empleado = {
        Id_NumEmp: $('#txtId_NumEmp').val(),
        Nombre: $('#txtNombre').val(),
        ApellidoPaterno: $('#txtApellidoPaterno').val(),
        ApellidoMaterno: $('#txtApellidoMaterno').val(),
        CatPuesto: {
            IdCatPuesto: $('#ddlCatPuestos').val()
        }
    }

    $.ajax({
        type: 'POST',
        url: 'http://localhost:56759/api/Empleado/Update',
        dataType: 'json',
        data: empleado,
        success: function (result) {
            $('#myModal').modal();
            $('#ModalUpdate').modal('hide');
            GetAll();
            Console(respond);
        },
        error: function (result) {
            alert('Ocurrio un error.' + result.responseJSON.ErrorMesage);
        }
    });
};

function Eliminar(Id_NumEmp) {
    if (confirm("¿Estas seguro que deseas eliminar el empleado?")) {
        $.ajax({
            type: 'GET',
            url: 'http://localhost:56759/api/Empleado/Delete?Id_NumEmp=' + Id_NumEmp,
            success: function (result) {
                $('#myModal').modal();
                GetAll();
            },
            error: function (result) {
                alert('Ocurrio un error al Eliminar.' + result.responseJSON.ErrorMesage);
            }
        });
    };
};

function GetById(Id_NumEmp) {
    $.ajax({
        type: 'GET',
        url: 'http://localhost:56759/api/Empleado/GetById?Id_NumEmp=' + Id_NumEmp,
        success: function (result) {
            $('#txtId_NumEmp').val(result.Object.Id_NumEmp);
            $('#txtNombre').val(result.Object.Nombre);
            $('#txtApellidoPaterno').val(result.Object.ApellidoPaterno);
            $('#txtApellidoMaterno').val(result.Object.ApellidoMaterno);
            $('#ddlIdCatPuestos').val(result.Object.CatPuesto.IdCatPuesto);
            $('#ModalUpdate').modal('show');
        },
        error: function (result) {
            alert('Ocurrio un error' + result.responseJSON.ErrorMesage);
        }
    });
}

function Modal() {
    var mostrar = $('#ModalUpdate').modal('show');
    IniciarEmpleado();

}

function IniciarEmpleado() {

    var empleado = {
        Id_NumEmp: $('#txtId_NumEmp').val(''),
        Nombre: $('#txtNombre').val(''),
        ApellidoPaterno: $('#txtApellidoPaterno').val(''),
        ApellidoMaterno: $('#txtApellidoMaterno').val(''),
        CatPuesto: {
            IdCatPuesto: $('#ddlCatPuestos').val(0)
        }
    }
}

function Actualizar() {
    var empleado = {
        Id_NumEmp: $('#txtId_NumEmp').val(),
        Nombre: $('#txtNombre').val(),
        ApellidoPaterno: $('#txtApellidoPaterno').val(),
        ApellidoMaterno: $('#txtApellidoMaterno').val(),
        CatPuesto: {
            IdCatPuesto: $('#ddlCatPuestos').val()
        }
    }

    if (empleado.Id_NumEmp == '') {
        Add(empleado);

    }
    else {
        Update(empleado);
    }
}