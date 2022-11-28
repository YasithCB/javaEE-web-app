<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.CustomerDTO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: Yasith C Bandara
  Date: 11/28/2022
  Time: 10:17 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- MDB -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.1/mdb.min.css"
            rel="stylesheet"
    />
</head>
<body>

<%
    ArrayList<CustomerDTO> customers = new ArrayList<>();

    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/thogakade", "root", "1234");
    PreparedStatement pstm = connection.prepareStatement("SELECT * FROM customer");
    ResultSet rs = pstm.executeQuery();

    while (rs.next()) {
        customers.add(new CustomerDTO(
                rs.getString(1),
                rs.getString(2),
                rs.getString(3),
                rs.getDouble(4)
        ));
    }

%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <!-- Container wrapper -->
    <div class="container-fluid">
        <!-- Toggle button -->
        <button
                class="navbar-toggler"
                type="button"
                data-mdb-toggle="collapse"
                data-mdb-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <i class="fas fa-bars"></i>
        </button>

        <!-- Collapsible wrapper -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Navbar brand -->
            <a class="navbar-brand mt-2 mt-lg-0" href="#">
                <img
                        src="https://mdbcdn.b-cdn.net/img/logo/mdb-transaprent-noshadows.webp"
                        height="15"
                        alt="MDB Logo"
                        loading="lazy"
                />
            </a>
            <!-- Left links -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="#">Order</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Item</a>
                </li>
            </ul>
            <!-- Left links -->
        </div>
        <!-- Collapsible wrapper -->

        <!-- Right elements -->
        <div class="d-flex align-items-center">
            <!-- Avatar -->
            <div class="dropdown">
                <a
                        class="dropdown-toggle d-flex align-items-center hidden-arrow"
                        href="#"
                        id="navbarDropdownMenuAvatar"
                        role="button"
                        data-mdb-toggle="dropdown"
                        aria-expanded="false"
                >
                    <img
                            src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"
                            class="rounded-circle"
                            height="25"
                            alt="Black and White Portrait of a Man"
                            loading="lazy"
                    />
                </a>
                <ul
                        class="dropdown-menu dropdown-menu-end"
                        aria-labelledby="navbarDropdownMenuAvatar"
                >
                    <li>
                        <a class="dropdown-item" href="#">My profile</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="#">Settings</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="#">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Right elements -->
    </div>
    <!-- Container wrapper -->
</nav>
<!-- Navbar -->

<main class="container mt-5">

    <h3 class="fw-bold">Add Customer</h3>

    <section class="row">
        <!--form-->
        <form class="col-5 mt-3" action="customer" method="post">
            <!-- 2 column grid layout with text inputs for the first and last names -->
            <div class="row mb-4">
                <div class="col">
                    <div class="form-outline">
                        <input type="text" id="form3Example1" name="cusId" class="form-control" />
                        <label class="form-label" for="form3Example1">Customer ID</label>
                    </div>
                </div>
                <div class="col">
                    <div class="form-outline">
                        <input type="text" id="form3Example2" name="cusName" class="form-control" />
                        <label class="form-label" for="form3Example2">Name</label>
                    </div>
                </div>
            </div>

            <!-- address input -->
            <div class="form-outline mb-4">
                <input type="text" id="form3Example3" name="cusAddress" class="form-control" />
                <label class="form-label" for="form3Example3">Address</label>
            </div>

            <!-- salary input -->
            <div class="form-outline mb-4">
                <input type="number" id="form3Example4" name="cusSalary" class="form-control" />
                <label class="form-label" for="form3Example4">Salary</label>
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn btn-primary btn-block mb-4">Save</button>
        </form>
        <!--form-->

        <!--table-->
        <div class="col-6">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Address</th>
                    <th scope="col">Salary</th>
                </tr>
                </thead>
                <tbody>
                    <%
                        for (CustomerDTO customer : customers) {
                    %>

                    <tr>
                        <td><%=customer.getId()%></td>
                        <td><%=customer.getName()%></td>
                        <td><%=customer.getAddress()%></td>
                        <td><%=customer.getSalary()%></td>
                    </tr>

                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <!--table-->
    </section>

    <div class="row col-5 gap-2">
        <button type="button" class="btn btn-danger col-3">Remove</button>
        <button type="button" class="btn btn-warning col-4">Update</button>
        <button type="button" class="btn btn-info col-4">Get All</button>
    </div>

</main>



<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.1/mdb.min.js"
></script>
<script src="assets/js/jquery-3.6.1.min.js"></script>
<!--<script>

  // customer regular expressions
  const cusIDRegex = /^(C)[0-9]{3}$/;
  const cusNameRegex = /^[A-z ]{5,20}$/;
  const cusAddressRegex = /^[0-9/A-z. ,]{7,}$/;
  const cusSalaryRegex = /^[0-9]{1,}[.]?[0-9]{1,2}$/;

  let customerValidationsOnSave = [];
  customerValidationsOnSave.push({reg: cusIDRegex, field: $('#cusId'),error:'Customer ID Pattern is Wrong : C001'});
  customerValidationsOnSave.push({reg: cusNameRegex, field: $('#cusName'),error:'Customer Name Pattern is Wrong : A-z 5-20'});
  customerValidationsOnSave.push({reg: cusAddressRegex, field: $('#cusAddress'),error:'Customer Address Pattern is Wrong : A-z 0-9 ,/'});
  customerValidationsOnSave.push({reg: cusSalaryRegex, field: $('#cusSalary'),error:'Customer Salary Pattern is Wrong : 100 or 100.00'});

  let customerValidationsOnEdit = [];
  customerValidationsOnEdit.push({reg: cusIDRegex, field: $('#editCusId'),error:'Customer ID Pattern is Wrong : C001'});
  customerValidationsOnEdit.push({reg: cusNameRegex, field: $('#editCusName'),error:'Customer Name Pattern is Wrong : A-z 5-20'});
  customerValidationsOnEdit.push({reg: cusAddressRegex, field: $('#editCusAddress'),error:'Customer Address Pattern is Wrong : A-z 0-9 ,/'});
  customerValidationsOnEdit.push({reg: cusSalaryRegex, field: $('#editCusSalary'),error:'Customer Salary Pattern is Wrong : 100 or 100.00'});

  /*validate all in any keyPress on anywhere on edit model*/
  $("#editCusId,#editCusName,#editCusAddress,#editCusSalary").on('keyup', function (event) {
    validateAllFieldsOnEdit();
  });

  /*focus next field by enter edit model*/
  $("#editCusId").on('keydown', function (event) {
    if (event.key === "Enter" && check(cusIDRegex,$('#editCusId')) ) {
      $('#editCusName').focus();
    }else {
      $('#editCusId').focus();
    }
  });
  $("#editCusName").on('keydown', function (event) {
    if (event.key === "Enter" && check(cusNameRegex,$('#editCusName')) ) {
      $('#editCusAddress').focus();
    }else {
      $('#editCusName').focus();
    }
  });
  $("#editCusAddress").on('keydown', function (event) {
    if (event.key === "Enter" && check(cusAddressRegex,$('#editCusAddress')) ) {
      $('#editCusSalary').focus();
    }else {
      $('#editCusAddress').focus();
    }
  });
  $("#editCusSalary").on('keydown', function (event) {
    if (event.key === "Enter" && check(cusSalaryRegex,$('#editCusSalary'))) {
      $('#btnEditCustomer').click();
      $('#editCusId').focus();
    }
  });
  /*focus next field by enter edit model*/

  /*function to check if all fields are correct in edit model*/
  function validateAllFieldsOnEdit() {
    let errorCount= 0;
    for (let validation of customerValidationsOnEdit) {
      if (check(validation.reg,validation.field)) {
        makeFieldAsCorrect(validation.field,"");
      }else {
        errorCount++;
        makeFieldAsError(validation.field, validation.error);
      }
    }
    setEditBtnState(errorCount);
  }
  function setEditBtnState(errorCount) {
    if (errorCount > 0) {
      $('#btnEditCustomer').attr('disabled',true);
    }else {
      $('#btnEditCustomer').attr('disabled',false);
    }
  }
  function getEditBtnState() {
    return $('#btnEditCustomer').attr('disabled') !== true;
  }

  $('#btnEditCustomer').click(function () {
    if (confirm('Are you sure to Edit this Customer?') && getEditBtnState()) {
      let customer = searchCustomer(selectedRowCusId);
      /*edit*/
      customer.id = $('#editCusId').val();
      customer.name = $('#editCusName').val();
      customer.address = $('#editCusAddress').val();
      customer.salary = $('#editCusSalary').val();


      $('#btnCloseCustomerEditModel').click();
      refreshCustomerTable();
    }
  });

  function searchCustomer (cusId) {
    for (let customer of customers) {
      if (customer.id === cusId) {
        return customer;
      }
    }
    return -1;
  }

  /*delete btn*/
  $('#btnDeleteCustomer').click(function () {
    let customer = searchCustomer(selectedRowCusId);
    customers.splice(customers.indexOf(customer),1);
    $('#btnCloseCustomerEditModel').click();
    refreshCustomerTable();

  });




  /*prevent focus another field when pressing tab btn*/
  $("#cusId,#cusName,#cusAddress,#cusSalary").on('keydown', function (event) {
    if (event.key === "Tab") {
      event.preventDefault();
    }
  });

  /*validate all in any keyPress on anywhere on save model*/
  $("#cusId,#cusName,#cusAddress,#cusSalary").on('keyup', function (event) {
    validateAllFieldsOnSave();
  });

  /*focus next field by enter save model*/
  $("#cusId").on('keydown', function (event) {
    if (event.key === "Enter" && check(cusIDRegex,$('#cusId')) ) {
      $('#cusName').focus();
    }else {
      $('#cusId').focus();
    }
  });
  $("#cusName").on('keydown', function (event) {
    if (event.key === "Enter" && check(cusNameRegex,$('#cusName')) ) {
      $('#cusAddress').focus();
    }else {
      $('#cusName').focus();
    }
  });
  $("#cusAddress").on('keydown', function (event) {
    if (event.key === "Enter" && check(cusAddressRegex,$('#cusAddress')) ) {
      $('#cusSalary').focus();
    }else {
      $('#cusAddress').focus();
    }
  });
  $("#cusSalary").on('keydown', function (event) {
    if (event.key === "Enter" && check(cusSalaryRegex,$('#cusSalary'))) {
      if (confirm('Are you sure to add this Customer?') && getSaveBtnState()) {
        $('#btnSaveCustomer').click();
        $('#cusId').focus();
      }
    }
  });
  /*focus next field by enter save model*/

  /*function to check if all fields are correct in save model*/
  function validateAllFieldsOnSave() {
    let errorCount= 0;
    for (let validation of customerValidationsOnSave) {
      if (check(validation.reg,validation.field)) {
        makeFieldAsCorrect(validation.field,"");
      }else {
        errorCount++;
        makeFieldAsError(validation.field, validation.error);
      }
    }
    setSaveBtnState(errorCount);
  }

  function check(reg,field){
    let value = field.val();
    return reg.test(value);
  }

  function setSaveBtnState(errorCount) {
    if (errorCount > 0) {
      $('#btnSaveCustomer').attr('disabled',true);
    }else {
      $('#btnSaveCustomer').attr('disabled',false);
    }
  }
  function getSaveBtnState() {
    if ($('#btnSaveCustomer').attr('disabled') === true) {
      return false;
    }else {
      return true;
    }
  }

  function makeFieldAsCorrect(field,error) {
    if (field.val().length <= 0) {
      defaultText(field,error);
    }else {
      correctText(field,error);
    }
  }
  function makeFieldAsError(field,error) {
    if (field.val().length <= 0) {
      defaultText(field,"");
    }else {
      errorText(field,error);
    }
  }

  function errorText(field,error) {
    field.css('border','1px solid red');
    field.parent().children('span').text(error);
  }

  function correctText(field,error) {
    field.css('border','1px solid green');
    field.parent().children('span').text(error);
  }

  function defaultText(field,error) {
    field.css("border",'1px solid white');
    field.parent().children('span').text(error);
  }


  let customers = [];

  $('#addCustomer').on('shown.bs.modal', function () {
    $('#cusId').focus();
  });
  $('#editCustomer').on('shown.bs.modal', function () {
    $('#editCusId').focus();
  });

  /*add sample data*/
  {
    var customer = {
      id : 'C001',
      name : 'Yasith',
      address : 'Opanayaka',
      salary : 49000
    }
    customers.push(customer);

    refreshCustomerTable();
    rowTrigger();
  }
  /*add sample data*/

  /*saving customer to array*/
  $("#btnSaveCustomer").click(function (){
    let customer = {
      id: $('#cusId').val(),
      name: $('#cusName').val(),
      address: $('#cusAddress').val(),
      salary: $('#cusSalary').val(),
    };
    customers.push(customer);
    renewFields();
    refreshCustomerTable();
    rowTrigger();
  });
  /*saving customer to array*/

  /*renew fields*/
  $('#btnRenew').click(function (){
    renewFields();
  });
  /*renew fields*/

  /*search btn action*/
  $('#btnSearchCustomer').click(function (){
    let available = false;
    for (let customer of customers) {
      if (customer.id === $('#cusId').val()){
        available = true;
        $('#cusName').val(customer.name);
        $('#cusAddress').val(customer.address);
        $('#cusSalary').val(customer.salary);
      }
    }
    if (!available){
      renewFields();
      alert('There are no customer like this!');
    }
  });
  /*search btn action*/

  function renewFields () {
    $('#cusId').val('');
    $('#cusName').val('');
    $('#cusAddress').val('');
    $('#cusSalary').val('');

    $('#editCusId').val('');
    $('#editCusName').val('');
    $('#editCusAddress').val('');
    $('#editCusSalary').val('');
  }

  var selectedRowCusId = '';
  function rowTrigger() {
    $('#cusTable>tr').click(function (){
      /*open edit cus model*/
      console.log('clicked')
      $('#btnEditDeleteCustomer').click();
      selectedRowCusId = $(this).children().eq(0).text();

      $('#editCusId').val(selectedRowCusId);
      $('#editCusName').val($(this).children().eq(1).text());
      $('#editCusAddress').val($(this).children().eq(2).text());
      $('#editCusSalary').val($(this).children().eq(3).text());


    });
  }

  function refreshCustomerTable(){
    $('#cusTable').empty();

    for (let customer of customers) {
      let row = `<tr><th scope="row">${customer.id}</th><td>${customer.name}</td><td>${customer.address}</td><td>${customer.salary}</td></tr>`
      $('#cusTable').append(row);
    }
  }

</script>-->
</body>
</html>