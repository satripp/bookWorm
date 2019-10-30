<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
<link rel="stylesheet" type="text/css" href="style2.css" />
<link href = "https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/main.js"></script>
</head>
<body onload="loadDetails()">
	<div class = "toolbar">
	<div class = "row" style="width: 100%; margin-left: 40px;">
		<div class = "column" id="left" style="width: 20%; margin-right: 20px;">
			<img src="images/bookworm2.png" onclick="homeBtnClick();" alt="BookWorm" style="width:100px;">
		</div>
		<div class = "column" id = "middle" style="width: 40%; margin-right: 40px;">
			<input type="text" name="query" id="query" placeholder="What book is on your mind?" style="float: left; width:70%;padding: 5px;border-radius: 4px;">
			<button id="button" type="button" onclick="validate()" style="background-color: lightgray;padding: 10px 20px;border-radius: 4px;margin: 6px;">Search</button>
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

	<div class = "resultsClass" style="margin-left: 40px;margin-right: 100px;">
		<div id = "resultsHeading"></div>
		<div class="row">
			<div class = "column" style="width: 20%;">
				<div id = "resultsPic" style="display: block;margin-left: auto;margin-right: auto;margin-top:20px;width: 40%;"></div>
			</div>
			<div class = "column" style="width: 80%;margin-top:20px;margin-right: auto;line-height: 110%;"> 
				<ul id = "results"></ul>
			</div>
		</div>
	</div>
</body>
</html>