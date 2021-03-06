<%@ page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.JdbcUtil, java.sql.*, javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
<script>
	function checkForm(f) {
		if(f.custname.value.trim()=="") {
			alert("회원 성명이 입력되지 않았습니다!!");
			f.custname.focus();
			return false;
		}
		if(f.phone.value.trim()=="") {
			alert("회원전화가 입력되지 않았습니다!!");
			f.phone.focus();
			return false;
		}
		if(f.address.value.trim()=="") {
			alert("회원주소가 입력되지 않았습니다!!");
			f.address.focus();
			return false;
		}
		if(f.joindate.value.trim()=="") {
			alert("가입일자가 입력되지 않았습니다!!");
			f.joindate.focus();
			return false;
		}
		if(f.grade.value.trim()=="") {
			alert("고객등급이 입력되지 않았습니다!!");
			f.grade.focus();
			return false;
		}
		if(f.city.value.trim()=="") {
			alert("도시코드가 입력되지 않았습니다!!");
			f.city.focus();
			return false;
		}
		alert("회원 수정이 완료되었습니다.");
	}
</script>
</head>
<body>
<table border=0>
<tr><td class="header" align="center"><h3>쇼핑몰 회원관리 ver 1.0</h3></td></tr>
<tr><td class="menu">
<a href="memberJoin.jsp">회원등록</a>
<a href="memberList.jsp">회원목록조회/수정</a>
<a href="money.jsp">회원매출조회</a>
<a href="index.jsp">홈으로</a>
</td></tr>
<tr><td align="center">
<%
	request.setCharacterEncoding("UTF-8");
	String custno = request.getParameter("custno");

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from member_tbl_02 where custno=?";
	
	con = JdbcUtil.getConnection();
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, custno);
	rs = pstmt.executeQuery();
%>
<section>
<b>홈쇼핑 회원 등록</b>
<% if(rs.next()) { %>
<form action="modReg.jsp" onsubmit="return checkForm(this)">
<table border=1>
	<tr>
		<td>회원번호(자동발생)</td>
		<td><input type="text" name="custno" id="custno" readonly value="<%=rs.getString(1) %>"/></td>
	</tr>
	<tr>
		<td>회원성명</td>
		<td><input type="text" name="custname" id="custname" value="<%=rs.getString(2) %>"/></td>
	</tr>
	<tr>
		<td>회원전화</td>
		<td><input type="text" name="phone" id="phone" value="<%=rs.getString(3) %>"/></td>
	</tr>
	<tr>
		<td>회원주소</td>
		<td><input type="text" name="address" id="address" value="<%=rs.getString(4) %>"/></td>
	</tr>		
	<tr>
		<td>가입일자</td>
		<td><input type="text" name="joindate" id="joindate" value="<%=rs.getString(5).substring(0, 10) %>"/></td>
	</tr>
	<tr>
		<td>고객등급[A:VIP,B:일반,C:직원]</td>
		<td><input type="text" name="grade" id="grade" value="<%=rs.getString(6) %>"/></td>
	</tr>		
	<tr>
		<td>도시코드</td>
		<td><input type="text" name="city" id="city" value="<%=rs.getString(7) %>"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="수정">
			<input type="button" value="조회" onclick="location.href='memberList.jsp'">
		</td>
	</tr>
</table>
</form>
<%} %>
</section>
</td></tr>
<tr><td class="footer" align="center">저작권 관련 정보</td></tr>
</table>
</body>
</html>