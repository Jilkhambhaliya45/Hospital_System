<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.db.DBConnect, com.dao.DoctorDao, com.entity.Specalist, java.util.List ,com.dao.SpecialistDao , com.entity.Doctor" %>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-centre">Edit Doctor Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-centre text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-centre text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						DoctorDao dao2=new DoctorDao(DBConnect.getConn());
						Doctor d=dao2.getDoctorById(id);
						%>
						
						<form action="../updateDoctor" method="post">
    <input type="hidden" name="id" value="<%=d.getId()%>">
    
    <div class="mb-3">
        <label class="form-label">Full Name</label>
        <input type="text" required name="fullname" class="form-control" value="<%= d.getFullName() %>">
    </div>

    <div class="mb-3">
        <label class="form-label">DOB</label>
        <input type="date" required name="dob" class="form-control" value="<%= d.getDob() %>">
    </div>

    <div class="mb-3">
        <label class="form-label">Qualification</label>
        <input type="text" required name="qualification" class="form-control" value="<%= d.getQualification() %>">
    </div>

    <div class="mb-3">
        <label class="form-label">Specialist</label>
        <select name="spec" required class="form-control">
            <option value="<%=d.getSpecialist()%>" selected><%=d.getSpecialist()%></option>
            <%
                SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
                List<Specalist> list = dao.getAllSpecialist();
                for (Specalist s : list) {
            %>
                <option value="<%=s.getSpecialistName()%>"><%=s.getSpecialistName()%></option>
            <%
                }
            %>
        </select>
    </div>

    <div class="mb-3">
        <label class="form-label">Email</label>
        <input type="text" required name="email" class="form-control" value="<%= d.getEmail() %>">
    </div>

    <div class="mb-3">
        <label class="form-label">Mob No</label>
        <input type="text" required name="mobno" class="form-control" value="<%= d.getMobNo() %>">
    </div>

    <div class="mb-3">
        <label class="form-label">Password</label>
        <input type="text" required name="password" class="form-control" value="<%= d.getPassword() %>">
    </div>

    <button type="submit" class="btn btn-primary col-md-12">Update</button>
</form>
						
						
					
					</div>
				</div>
			</div>
		
		</div>
	</div>


</body>
</html>