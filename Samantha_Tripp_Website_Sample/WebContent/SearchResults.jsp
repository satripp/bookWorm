<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Search Results</title>
	<link rel="stylesheet" type="text/css" href="style2.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="js/main.js"></script>
</head>
<body onload="searchQuery()">
	<div class = "toolbar">
	<div class = "row" style="width: 100%; margin-left: 40px;">
		<div class = "column" id="left" style="width: 20%; margin-right: 20px;">
			<img src="images/bookworm2.png" onclick="homeBtnClick();" alt="BookWorm" style="width:100px;">
		</div>
		<div class = "column" id = "middle" style="width: 40%; margin-right: 40px;">
		
			<input type="text" name="query" id="query" placeholder="What book is on your mind?" style="float: left; width:70%;"> 
			<button id="button" type="button" style="padding: 10px 20px;border-radius: 4px;margin: 6px;" onclick="validate()">Search</button>
			
			
			<div id="error" style="color:black"></div>
		</div>
		<div class = "column" id="right" style="width: 30%;">
			<div class = "row">
				<div class = "column" style="color:gray;">
				<input type="radio" name="filter" value="Name"> Name<br>
				<input type="radio" name="filter" value="Author"> Author
				</div>
				<div class = "column" style="color:gray;">
				<input type="radio" name="filter" value="ISBN"> ISBN<br>
				<input type="radio" name="filter" value="Publisher"> Publisher
				</div>
			</div>
			
		</div>
	</div>
	</div>
	<div class = "resultsClass">
		<div id = "resultsHeading"></div>
		<ul id = "results"></ul>	
	</div>
	
</body>
</html>