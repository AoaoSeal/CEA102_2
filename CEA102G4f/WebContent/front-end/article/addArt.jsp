<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.art.model.*"%>

<%
	ArticleVO artVO = (ArticleVO) request.getAttribute("ArticleVO");
	
%>



<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>���u��Ʒs�W - addEmp.jsp</title>




</head>
<body bgcolor='white'>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resource/ckeditor2/ckeditor.js"></script>
<script>
$(document).ready(function() {
	   CKEDITOR.replace('ldExpr');
	   console.log("ready!");
	  });
</script>



<!-- 	<h3>��Ʒs�W:</h3> -->

	<%-- ���~��C --%>
	
	
	<div class="addView">
	<FORM METHOD="post" enctype="multipart/form-data"
		ACTION="<%=request.getContextPath()%>/art/art.do" name="form1">
	<c:if test="${not empty errorMsgs}">
<!-- 		<font style="color: red">�Эץ��H�U���~:</font> -->
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
		<div id="addTop">
			�峹����:
			<input  type="radio" name="artcNo" value="17001" checked>�߱o
			<input  type="radio" name="artcNo" value="17002">����
			<input  type="radio" name="artcNo" value="17003">�˳�
			<input  type="radio" name="artcNo" value="17004">�s�D
			<input  type="radio" name="artcNo" value="17005">��L
			<br>
				�峹���D:
				<input type="TEXT" name="artTitle" size="20	" autocomplete="off" placeholder="�п�J���D"
				required value="<%=(artVO == null) ? "" : artVO.getArtTitle()%>" />
			<br>
			�w���Ϥ�:
				<input type="file" id="myArtFile" name="artPic" size="45"
					value="<%=(artVO == null) ? "�w���Ϥ�" : artVO.getArtPic()%>" />
					<div id="myArtpreviewDad">
						 <div id="myArtpreview"></div>
				 </div>
			<br>
		</div>
		 <input type="hidden" name="myArtfilename" id="filename">

		
	<div id="addCkedit">
		<div class=ckedit>
			�峹���e:
			<textarea id="ldExpr" name="artText" cols="32" rows="50" required></textarea>
		</div>
	</div>	
	<div id="addButton">
			<div id="addSend">
				<input type="hidden" name="memId" size="45" value="${memberVO.memId}" >
				<input type="hidden" name="artCount" size="45" value="1" >
				<input type="hidden" name="artStatus" size="1"value="1" >
				 <input type="hidden"name="action" value="insert"> 
				<input class="submit" type="submit"value="���ɤ峹">
			</div>
<!-- 			<div id="addSave"> -->
<%-- 				<input type="hidden" name="memId" size="45" value="${memberVO.memId}" > --%>
<!-- 				<input type="hidden" name="artCount" size="45" value="1" > -->
<!-- 				<input type="hidden" name="artStatus" size="1"value="0" /> -->
<!-- 				 <input type="hidden"name="action" value="insert">  -->
<!-- 				<input type="submit"value="�s����Z"> -->
<!-- 			</div> -->
		</div>	
	</FORM>

</div>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/styleWen.css">
    <script type="text/javascript">

      
        
        $(document).ready(function(){
        	init2();
        })
        
        
        function init2() {

            let myFile = document.getElementById("myArtFile");
            let filename = document.getElementById("myArtfilename");
            let preview = document.getElementById('myArtpreview');

            myFile.addEventListener('change', function(e) {
                let files = e.target.files;
                if (files) {
                    let file = files[0];
                    if (file.type.indexOf('image') > -1) {


                        let reader = new FileReader();
                        reader.addEventListener('load', function(e) {
                            console.log(e);
                            let result = e.target.result;
                            
                            let img = document.createElement('img');
                            img.setAttribute('src', result);
                            $("#myArtpreview").empty();
                            preview.append(img);
                        });
                        reader.readAsDataURL(file); 
                    } else {
                        alert('�ФW�ǹϤ��I');
                    }
                }
            });
        }
    </script>
</body>


</html>