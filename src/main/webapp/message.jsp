<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String msg = (String) request.getAttribute("msg");
%>
<%
if (msg != null) {
%>

<div class="toast-container position-fixed bottom-0 end-0 p-3">
	<div id="liveToast" class="toast show" role="alert"
		aria-live="assertive" aria-atomic="true">
		<div class="toast-header indigo text-white">
			<strong class="me-auto">Message</strong> <small>just now</small>
			<button type="button" class="btn-close btn-dark"
				data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
		<div class="toast-body text-black">
			<%=msg%>
			<a class="icon-link icon-link-hover link-primary"
				style="-bs-icon-link-transform: translate3d(0, -.125rem, 0);"
				href="showNote.jsp"> <svg class="bi text-black" aria-hidden="true">
					<use xlink:href="#clipboard"></use></svg> Click here to View
			</a>
		</div>
	</div>
</div>

<script type="text/javascript">

function show(){
	  document.getElementById('liveToast').style = "display:none";
	}
	setTimeout("show()",5000);


</script>

<%
}
%>
