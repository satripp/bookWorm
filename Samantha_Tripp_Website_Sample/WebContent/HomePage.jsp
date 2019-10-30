<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home Page</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
		<link href="https://fonts.googleapis.com/css?family=Old+Standard+TT&display=swap" rel="stylesheet">
	</head>
	<body onload="ifError()">
		<div class="header">
			<img src="images/bookworm2.png" alt="BookWorm" style="width:80px;">
		</div>
		  
		  
		</div>
		<div class="myformclass">
			<h1 style="font-family: 'Old Standard TT', serif;">BookWorm: A Book Search Engine</h1><br />
			<input type="text" id="query" name="query" placeholder="Search for your favorite book!"><br />
			<table>
			<tr><p></p></tr>
			<tr>
			<td><input type="radio" name="filter" value="Name"> Name</td>
			<td><input type="radio" name="filter" value="Author"> Author</td>
			<td><input type="radio" name="filter" value="ISBN"> ISBN</td>
			<td><input type="radio" name="filter" value="Publisher"> Publisher</td>
			</tr>
			</table>
			
			<button id="button" type="button" onclick="validate()" style="float: right;">Search</button>
			<div id="error">
			</div>
		</div>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="js/main.js"></script>
	</body>
</html>