<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="bean.RequestBean, java.util.List"%>
<%
	List<bean.RequestBean> list = (List<bean.RequestBean>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link href="/R03TeamB/css/RequestManagement.css" rel="stylesheet" type="text/css">
    <title>確認</title>
    <script type="text/javascript">

    </script>
</head>

<body>
    <h1 class="button-name right mb-0">
        <button type="submit" class="out btn-outline-primary">ログアウト</button>
    </h1>
    <div class="m-2 mt-0">
        <h1 class="button-name1">
            <button type="submit" class="top btn-outline-danger" >管理者画面</button>
        </h1>            
        <h1 class="button-name2">
            <button type="submit" class="check btn-outline-primary" onclick="location.href='../m03_InventoryList/InventoryListServlet'">在庫一覧</button> <!-- 四角角丸-->
        </h1>        
    </div>

    <div class="title">
        <h2 class="text-center">証明書申込画面</h2>

    </div>

    <div class="container">
        <table class="table table-bordered">
        
        		<tr class="center">
            		<th>受付ID</th>
            		<th>学籍番号</th>
            		<th>受付日</th>
            		<th>状態</th>
            		<th>状態変更</th>
            	</tr>
        	<% for(RequestBean rb : list){ %>
           	 	<tbody>
                	<tr>
                    	<td class="center"><a href = "../m02_requestdetails/RequestDetailsServlet?id=<%=rb.getReception_id()%>" id="IDlink"><%= rb.getReception_id() %></a></td>
                    	<td class="center"><%=rb.getStudent_no() %></td>
                    	<td class="center"><%=rb.getReception_date() %></td>
                    	<td class="center"><%=rb.getDivision_flag() %></td>
                    	<td style="width: 14%" class="center"><button type="submit" class="btn btn-outline-primary" onclick="location.href='../m03_InventoryList/InventoryListServlet?id=<%=rb.getReception_id() %>'"></button></td>
                	</tr>
            	</tbody>
            <%} %>
        </table>
    </div>
</body>