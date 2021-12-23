<%@page import="bean.RequestDetailsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="bean.RequestDetailsBean, java.util.List"%>
<%
	List<RequestDetailsBean> list = (List<RequestDetailsBean>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link href="/R03TeamB/css/RequestDetails.css" rel="stylesheet" type="text/css">
    <title>確認</title>
</head>

<body class="container mt-3">
    <div class="text-center col-md d-lg-flex align-items-left border-0">
        <h3 class="button-name">
            <button type="submit" class="top btn-outline-danger" class="left" onclick="location.href='../m01_requestmanagement/RequestManagementServlet'">依頼管理画面</button>
        </h3>
    </div>

    <div class=" text-center col-md d-lg-flex align-items-left border-0">
        <h2 class="button-name">
            <button type="submit" class="check btn-outline-primary" onclick="location.href='../m03_InventoryList/InventoryListServlet'">在庫一覧</button> <!-- 四角角丸-->
        </h2>

    </div>

    <table class="table table-bordered">
    <% for(RequestDetailsBean rdb : list){ %>
        <tbody>
            <tr>
                <td class="center" colspan="3"><%=rdb.getName() %></td>
            </tr>

            <tr>
                <td class="center">受付ID</td>
                <td class="center">学籍番号</td>
                <td class="center"> 生年月日</td>
            </tr>

            <tr>
                <td class="center"><%=rdb.getReception_id() %></td>
                <td class="center"><%=rdb.getStudent_no() %></td>
                <td class="center"><%=rdb.getBirthday() %></td>
                
            </tr>
            <tr>
                <td class="center">受付日</td>
                <td class="center">学年</td>
                <td class="center">学科</td>
            </tr>
            <tr>
                <td class="center"><%=rdb.getReception_date() %></td>
                <td class="center"><%=rdb.getSchool_grade() %></td>
                <td class="center"><%=rdb.getDept_name() %></td>
            </tr>
            <tr>
                <td class="center" colspan="2">証明書の種類</td>
                <td class="center">部数</td>
            </tr>
            <tr>
                <td class="center" colspan="2"><%=rdb.getCertificate_name() %></td>
                <td class="center"><%=rdb.getQuantity() %></td>
           </tr>
        </tbody> 
    </table>

    <div class="price">
        <table class="table table-bordered " style="width: 50%">
            <thead>
            <tbody>
                <tr>
                    <td style="width: 40%">合計金額</td>
                    <td style="width: 60%"class="right"><%=rdb.getTotal_price() %></td>
                </tr>
            </tbody>
            </thead>
            <%} %>
        </table>
   
    </div>
</body>