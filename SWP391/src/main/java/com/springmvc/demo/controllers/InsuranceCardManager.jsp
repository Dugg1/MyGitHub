<%@ page import="java.util.Base64" %>
<%@ page import="org.springframework.ui.ModelMap" %>
<%@ page import="org.dom4j.rule.Mode" %>
<%@ page import="com.springmvc.demo.repositories.AccountinfoRepository" %>
<%@ page import="com.springmvc.demo.models.Accountinfo" %>
<%@ page import="java.util.stream.StreamSupport" %>
<%@ page import="java.util.ArrayList" %><%--
    Document   : Login
    Created on : Jun 4, 2022, 2:25:25 AM
    Author     : BachDuc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <%--    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="../myCss/Mycss.css" rel="stylesheet" type="text/css">
    <link href="../Admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../Admin/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../Admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="index.html">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Interface
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
               aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-cog"></i>
                <span>Components</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Custom Components:</h6>
                    <a class="collapse-item" href="buttons.html">Buttons</a>
                    <a class="collapse-item" href="cards.html">Cards</a>
                </div>
            </div>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
               aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span>Utilities</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                 data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Custom Utilities:</h6>
                    <a class="collapse-item" href="utilities-color.html">Colors</a>
                    <a class="collapse-item" href="utilities-border.html">Borders</a>
                    <a class="collapse-item" href="utilities-animation.html">Animations</a>
                    <a class="collapse-item" href="utilities-other.html">Other</a>
                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Addons
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
               aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-folder"></i>
                <span>Pages</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Login Screens:</h6>
                    <a class="collapse-item" href="login.html">Login</a>
                    <a class="collapse-item" href="register.html">Register</a>
                    <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                    <div class="collapse-divider"></div>
                    <h6 class="collapse-header">Other Pages:</h6>
                    <a class="collapse-item" href="404.html">404 Page</a>
                    <a class="collapse-item" href="blank.html">Blank Page</a>
                </div>
            </div>
        </li>

        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="charts.html">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Charts</span></a>
        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item active">
            <a class="nav-link" href="tables.html">
                <i class="fas fa-fw fa-table"></i>
                <span>Tables</span></a>
        </li>

        <div class="sidebar-heading">
            Account Manage
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
               aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-folder"></i>
                <span>Pages</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Login Screens:</h6>
                    <a class="collapse-item" href="login.html">Login</a>
                    <a class="collapse-item" href="register.html">Register</a>
                    <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                    <div class="collapse-divider"></div>
                    <h6 class="collapse-header">Other Pages:</h6>
                    <a class="collapse-item" href="404.html">404 Page</a>
                    <a class="collapse-item" href="blank.html">Blank Page</a>
                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>

    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <form class="form-inline">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                </form>

                <!-- Topbar Search -->
                <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                               aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <!-- Nav Item - Alerts -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-bell fa-fw"></i>
                            <!-- Counter - Alerts -->
                            <span class="badge badge-danger badge-counter">3+</span>
                        </a>
                        <!-- Dropdown - Alerts -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="alertsDropdown">
                            <h6 class="dropdown-header">
                                Alerts Center
                            </h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-primary">
                                        <i class="fas fa-file-alt text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 12, 2019</div>
                                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-success">
                                        <i class="fas fa-donate text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 7, 2019</div>
                                    $290.29 has been deposited into your account!
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-warning">
                                        <i class="fas fa-exclamation-triangle text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 2, 2019</div>
                                    Spending Alert: We've noticed unusually high spending for your account.
                                </div>
                            </a>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                        </div>
                    </li>

                    <!-- Nav Item - Messages -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-envelope fa-fw"></i>
                            <!-- Counter - Messages -->
                            <span class="badge badge-danger badge-counter">7</span>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="messagesDropdown">
                            <h6 class="dropdown-header">
                                Message Center
                            </h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="../Admin/img/undraw_profile_1.svg"
                                         alt="...">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div class="font-weight-bold">
                                    <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                        problem I've been having.</div>
                                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="../Admin/img/undraw_profile_2.svg"
                                         alt="...">
                                    <div class="status-indicator"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">I have the photos that you ordered last month, how
                                        would you like them sent to you?</div>
                                    <div class="small text-gray-500">Jae Chun · 1d</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="../Admin/img/undraw_profile_3.svg"
                                         alt="...">
                                    <div class="status-indicator bg-warning"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">Last month's report looks great, I am very happy with
                                        the progress so far, keep up the good work!</div>
                                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                         alt="...">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                        told me that people say this to all dogs, even if they aren't good...</div>
                                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                </div>
                            </a>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                        </div>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                            <img class="img-profile rounded-circle"
                                 src="../Admin/img/undraw_profile.svg">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Profile
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                Settings
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Activity Log
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Insurance Card Manager Table</h1>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header ">
                        <h6 class="m-0 font-weight-bold text-primary">Insurance Card Manager</h6>

                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div  class="dataTables_wrapper dt-bootstrap4 no-footer"><div class="row">
                                <div class="col-sm-12 col-md-6"><div class="dataTables_length" id="">
                                    <label>Show
                                        <select name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option><option value="100">100</option>
                                        </select> entries
                                        <%--                                    <button style="width: 44%;background-color: #4e73df;" type="button" class="btn btn-info">New Request</button>--%>
                                        <%--                                    //POPUP FORM NEW REQUEST--%>
                                        <div style="display: inline-block" class="container">
                                            <button style="width: 44%;background-color: #4e73df;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                                New Card
                                            </button>
                                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" style="color: #4c5b6c;font-weight: bold;" id="exampleModalLabel">Adding new Insurance</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">

                                                            <div class="mb-3">
                                                                <label  class="form-label">Name Card</label>
                                                                <input form="docload" name="namecard" type="text" class="form-control"  aria-describedby="">
                                                            </div>
                                                            <%--                                                        //Option testing--%>
                                                            <div class="mb-3 ">
                                                                <label  class="form-label">Type Request</label>
                                                                <div class="box">
                                                                    <select form="docload" name="typecard">
                                                                        <option value="Vehicle Insurance">Vehicle Insurance</option>
                                                                        <option value="Property Insurance">Property Insurance</option>
                                                                        <option value="Business Insurance">Business Insurance</option>
                                                                        <option value="Additional Insurance">Additional Insurance</option>
                                                                        <option value="Health Insurance">Health Insurance</option>
                                                                        <option value="Life Insurance">Life Insurance</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <%--                                                        //Option testing--%>
                                                            <div class="mb-3">
                                                                <label  class="form-label">Description Card</label>
                                                                <textarea form="docload" name="descriptioncard" id="subject" class="form-control"  placeholder="Describe your request.." style="height:200px"></textarea>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label  class="form-label">Attachment</label>
                                                                <input class="btn btn-primary" form="docload"   class="m-t-30"
                                                                       type="file"
                                                                       accept="image/*"  name="docitem"
                                                                       id="file"
                                                                       onchange="loadFile(event)"
                                                                       style="display: block;">
                                                                <%--                                                            // ket thuc form nhan du lieu File--%>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label  class="form-label">Price by Year</label>
                                                                <input form="docload" name="price" type="text" class="form-control"  aria-describedby="">
                                                                <%--                                                                <input  type="tẽt" form="docload" id="tentacles" name="level"--%>
                                                                <%--                                                                        min="1" max="10">--%>
                                                            </div>

                                                            <button  type="submit" form="docload" class="btn btn-primary">Submit</button>
                                                            <form id="docload" action="/AdminAccount/addcard" method="POST" enctype="multipart/form-data" ></form>

                                                        </div>
                                                        <%--                                                    <div class="modal-footer">--%>
                                                        <%--                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                                                        <%--                                                        <button style="background-color: #4e73df;" type="button" class="btn btn-primary">Save changes</button>--%>
                                                        <%--                                                    </div>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--                                    //END POPUP FORM NEW REQUEST--%>
                                    </label></div></div>
                                <div class="col-sm-12 col-md-6">
                                    <div id="dataTable_filter" class="dataTables_filter">
                                        <label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
                                        </label>
                                    </div>
                                </div>
                            </div>
                                <div class="row">
                                    <div class="col-sm-12"><table class="table table-bordered dataTable no-footer" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" style="width: 97px;" aria-sort="ascending" aria-label="IDResquest: activate to sort column descending">Id Card</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" style="width: 115px;" aria-label="gmailAccount: activate to sort column ascending">Name Card</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" style="width: 106px;" aria-label="RoleAccount: activate to sort column ascending">Description Card</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" style="width: 113px;" aria-label="LevelRequest: activate to sort column ascending">Type Card</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" style="width: 108px;" aria-label="TypeRequest: activate to sort column ascending">Price By Year</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" style="width: 108px;" aria-label="TypeRequest: activate to sort column ascending">Modify</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="icitem" items="${iclist}">
                                            <tr>
                                                <td>${icitem.getIdCard()}</td>
                                                <td style="display: flex;">
                                                    <img style="display: inline-block;" src="${icitem.getImgString()}" class="rounded-circle" width="62" height="62"/>
                                                    <div style="display: inline-block;text-align: center;padding-left: 24px;padding-top: 20px;padding-bottom: 30px;">${icitem.getNameCard()}</div>
                                                </td>
                                                <td>${icitem.getDescriptionCard()}</td>
                                                <td>${icitem.getTypeCard()}</td>
                                                <td>${icitem.getPriceByYear()}</td>
                                                <td>
                                                    <a href="ActiveCard/${icitem.getIdCard()}">
                                                        <button style="display: inline-block" class="${icitem.getColorButtonActive()}" role="button">${icitem.getTextButtonActive()}</button>
                                                    </a>
                                               <%--     //POP UP EDIT PRODUCT--%>
                                                        <button type="button" class="button-7" role="button" data-toggle="modal" data-target="#${icitem.getID()}">
                                                            Edit Card
                                                        </button>
                                                        <div class="modal fade" id="${icitem.getID()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" style="color: #4c5b6c;font-weight: bold;" id="${icitem.getID()}">Edit Insurance Card :${icitem.getNameCard()}</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">

                                                                        <div class="mb-3">
                                                                            <label  class="form-label">Name Card</label>
                                                                            <input form="e${icitem.getID()}" name="namecard" value="${icitem.getNameCard()}" type="text" class="form-control"  aria-describedby="">
                                                                        </div>
                                                                            <%--                                                        //Option testing--%>
                                                                        <div class="mb-3 ">
                                                                            <label  class="form-label">Type Request</label>
                                                                            <div class="box">
                                                                                <select form="e${icitem.getID()}" name="typecard">
                                                                                    <option selected hidden value="${icitem.getTypeCard()}">${icitem.getTypeCard()}</option>
                                                                                    <option value="Vehicle Insurance">Vehicle Insurance</option>
                                                                                    <option value="Property Insurance">Property Insurance</option>
                                                                                    <option value="Business Insurance">Business Insurance</option>
                                                                                    <option value="Additional Insurance">Additional Insurance</option>
                                                                                    <option value="Health Insurance">Health Insurance</option>
                                                                                    <option value="Life Insurance">Life Insurance</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                            <%--                                                        //Option testing--%>
                                                                        <div class="mb-3">
                                                                            <label  class="form-label">Description Card</label>
                                                                            <textarea form="e${icitem.getID()}"  name="descriptioncard"  class="form-control"  placeholder="Describe your request.." style="height:200px">${icitem.getDescriptionCard()}</textarea>
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label  class="form-label">Attachment</label>
                                                                            <input class="btn btn-primary" form="e${icitem.getID()}"   class="m-t-30"
                                                                                   type="file"
                                                                                   accept="image/*"  name="docitem"
                                                                                   id="file"
                                                                                   onchange="loadFile(event)"
                                                                                   style="display: block;">
                                                                                <%--                                                            // ket thuc form nhan du lieu File--%>
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <label  class="form-label">Price by Year</label>
                                                                            <input form="e${icitem.getID()}" name="price" value="${icitem.getPriceByYear()}" type="text" class="form-control"  aria-describedby="">
                                                                        </div>
                                                                        <button  type="submit" form="e${icitem.getID()}" class="btn btn-primary">Submit</button>
                                                                        <input hidden readonly name="ID" value="${icitem.getIdCard()}" form="e${icitem.getID()}" >
                                                                        <form id="e${icitem.getID()}" action="/AdminAccount/editcard" method="POST" enctype="multipart/form-data" ></form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%--                                                        //END POP UP EDIT PRODUCT--%>

                                                </td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                    </div>
                                </div>
                                <div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing 0 to 0 of 0 entries</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item next disabled" id="dataTable_next"><a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">Next</a></li></ul></div></div></div></div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="../Admin/vendor/jquery/jquery.min.js"></script>
<script src="../Admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<%--<script src="Admin/vendor/jquery-easing/jquery.easing.min.js"></script>--%>

<!-- Custom scripts for all pages-->
<script src="../Admin/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<%--<script src="Admin/vendor/datatables/jquery.dataTables.min.js"></script>--%>
<%--<script src="Admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>--%>
<script src="../myCss/myJS.js"></script>
<!-- Page level custom scripts -->
<%--<script src="Admin/js/demo/datatables-demo.js"></script>--%>

</body>

</html>