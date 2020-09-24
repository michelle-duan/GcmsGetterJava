<%@ page language="java" contentType="text/html; charset=ISO-8859-1"                                                                        
    pageEncoding="ISO-8859-1"%>  
                                                                                                                                                    
<%@page import="java.util.Properties"%>                                                                                                     
<%@page import="javax.mail.Session"%>                                                                                                       
<%@page import="javax.mail.Authenticator"%>                                                                                                 
<%@page import="javax.mail.PasswordAuthentication"%>                                                                                        
<%@page import="javax.mail.Message"%>                                                                                                       
<%@page import="javax.mail.internet.MimeMessage"%>                                                                                          
<%@page import="javax.mail.internet.InternetAddress"%>                                                                                      
<%@page import="javax.mail.Transport"%>      



                                                                                               
<html>
	<head>
		<title>GcmsGetter</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="landing is-preload">

		<!-- Header -->
			<header id="header"class="alt">
				<h1><a href="index.html">Get on the path to results today</a></h1>
				<nav id="nav">
					<ul>
					</ul>
				</nav>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="content">
					<div class="inner">
						<header>
							<h2>GcmsGetter</h2>
							<p>Get gcms notes you can rely on</p>
						</header>
						<ul class="actions">
							<li><a href="#" class="button huge">order now</a></li>
						</ul>
					</div>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="wrapper">
				<div class="inner">
					<ul class="features">
						<li>
							<h3 class="icon style1 solid fa-chart-area">What's GCMS Notes</h3>
							<p>GCMS notes or Global Case Management System notes is Canada immigration’s official detailed record of applicant's file. Applicants usually can find immigration officer's comments on their file and get a better idea on where they are in the process and why their application are stuck. </p>
						</li>
						<li>
							<h3 class="icon style2 solid fa-chart-pie">Focus on Efficiency and Privacy</h3>
							<p>To get the note, the applicant has to have a contact who is a Canadian citizen or permanent resident living in Canada. We understand your circumstances, take your privacy seriously and will help you order your GCMS notes. We deliver most of our notes in about 35 days.</p>
						</li>
						<li>
							<h3 class="icon style3 solid fa-cube">Order Your Notes Today</h3>
							<p>Don't wait! Order your GCMS notes today. Let the notes help you figure out what your best next steps are. The sooner you take action, the better your chances of taking the correct steps to get the results you want.</p>
						</li>
					</ul>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper cta">
				<div class="inner">
					<header>
						<h2>Let GcmsGetter help you get your notes today</h2>
						<ul class="actions">
							<li><a href="#" class="button big">Order Notes Now</a></li>
						</ul>
					</header>
					<p>All you need to do is simply fill out the form below. Once we get your information, we will email you a consent form and have you sign. From there, your GCMS notes will usually come back in around 35 days.</p>
				</div>
			</section>
		<!-- Three -->
				<section id="four" class="wrapper style4 special">
					<div class="container medium"></div>
						<header class="major"></header>
							<h2>Order now<br />
							simply fill out the form</h2>    
                                                                                                                                
<%                                                                                                                                          
String firstName = null;                                                                                                                   
String lastName = null;                                                                                                                     
String userEmail = null;                                                                                
String uci = null;                                                                                                                                                                                                    
String message = null;                                                                                                                      
String send = request.getParameter("send");                                                                                                                                                                                                   

if(send!=null){
        firstName = request.getParameter("firstName");
        lastName = request.getParameter("lastName");                 
        userEmail = request.getParameter("userEmail");
        uci = request.getParameter("uci");  
        message = request.getParameter("message");   
        
        try{             
        		//used to store project configuration settings in key value pairs
                Properties props = new Properties();  
                //enable use of any authentication mechanism
                props.put("mail.smtp.auth", "true"); 
                //enables the use of the STARTTLS command to switch the connection to 
                //a TLS-protected connection
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.host", "smtp.gmail.com"); 
                props.put("mail.smtp.port", "587");  
                
                
                final String myAccountEmail = "gcmsgetter@gmail.com";
                final String password = "samplepassword11";                  
            	
            // create a session class to represent a mail
            // The class authenticator knows how to authenticate network connection 
            Session sessionMail = Session.getInstance(props, new Authenticator() {
            			//a method called to authenticate
                 public PasswordAuthentication getPasswordAuthentication() {      
                         return new PasswordAuthentication(myAccountEmail, password);
                 }                                                                    
                });                                                                   

            
            // MimeMessage class represents a MIME-format email message
            Message msg = new MimeMessage(sessionMail);
            

            // set the from and to email address, subject and email body
            msg.setFrom(new InternetAddress(myAccountEmail));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(myAccountEmail));
            msg.setSubject("New Order from GcmsGetter");
            msg.setText("Hi there, \nYou have a new gcms notes order. \nFirst Name: "+ firstName + "\nLast Name: " + lastName + "\nUser Email: " + userEmail + "\nUCI: " + uci + "\nMessage: " + message);
            Transport.send(msg);
            System.out.println("Message sent successfully");
            
            // redirect to order success page
            response.sendRedirect("http://localhost:8080/jspdemo/success-page.html");
        }catch(Exception e){
        		//print method calls program was in when exception thrown
                e.printStackTrace(response.getWriter());
        }
}
%>

<form name="emailForm" action="final-project-homepage.jsp" method="post">
        First Name *: <input type="text" name="firstName" required ><br>
        Last Name *: <input type="text" name="lastName" required ><br>        
        Email Address *: <input type="text" name="userEmail" required><br>
        UCI Number/File Number *: <input type="text" name="uci" required><br>       

        Message (Optional): <input type="text" name="message"><br>
        <input type="submit" name="send" value="send">
</form>
				</section>
		<!-- Footer -->
			<footer id="footer">
				<div class="content">
					<div class="inner">
						<section class="about">
							<h3>Contact GcmsGetter</h3>
							<p>Your question is important to us. For any inquiries, feel free to email us at: support@gcmsgetter.com</p>
						</section>
						<ul class="icons bulleted">
							<li class="icon solid fa-map-marker-alt">
								<h3>Location</h3>
								<p>Vancouver<br />
								BC, Canada</p>
							</li>
						</ul>
						<ul class="icons bulleted">
							<li class="icon solid fa-envelope">
								<h3>Email</h3>
								<p><a href="#">support@gcmsgetter.com</a></p>
							</li>
						</ul>
					</div>
				</div>
				<p class="copyright">&copy; GcmsGetter. All Rights Reserved.<br />
				<a href="#">Terms of Use</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact</a></p>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>
