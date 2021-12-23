<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="bean.InventoryListBean, java.util.List"%>
<%
	List<bean.InventoryListBean> list = (List<bean.InventoryListBean>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link href="/R03TeamB/css/InventoryList.css" rel="stylesheet" type="text/css">
    <title>確認</title>
</head>

<body>
    <h1 class="button-name right mb-0">
        <button type="submit" class="out btn-outline-primary">ログアウト</button>
    </h1>
    <div class="m-2 mt-0">
        <h1 class="button-name1">
            <button type="submit" class="top btn-outline-danger"  onclick="location.href='../m01_requestmanagement/RequestManagementServlet'">依頼管理画面</button>
    </div>

    <div class="title">
        <h2 class="text-center">在庫一覧</h2>

    </div>

    <div class="container">
        <table class="table table-bordered">
            <tbody>
            	<tr class="center">
            		<th>受付ID</th>
            		<th>メールアドレス</th>
            		<th>受付日</th>
            	</tr>
        		<% for(InventoryListBean ib : list){ %>
                	<tr>
                  	  <td class="center"><%=ib.getReception_id() %></td>
                   	 <td class="center"><%=ib.getEmail() %></td>
                   	 <td class="center"><%=ib.getReception_date() %> </td>
               	 </tr>
                <%} %>
            </tbody>
        </table>
    </div>
</body>