function validate(){
	document.getElementById('error').innerHTML = "";
	var query = document.getElementById('query').value;
	
	var xhttp = new XMLHttpRequest();
    xhttp.open("GET", 
    			"hw2servlet?query="+document.getElementById("query").value,
    			false);
    xhttp.send();
	if (xhttp.responseText.trim().length > 0) {
		sessionStorage.setItem("error", xhttp.responseText);
		location.href = "HomePage.jsp"
		return false;
    }
	
	var filter_val = $("input[name='filter']:checked").val();
	location.href = "SearchResults.jsp"
	sessionStorage.setItem("book", query);
	sessionStorage.setItem("filter", filter_val);
}	
function ifError(){
	var error = sessionStorage.getItem("error")
	document.getElementById("error").innerHTML = error;
	error = "";
	sessionStorage.setItem("error", "");
	
}
function noResult(){
	location.href = "HomePage.jsp";
	sessionStorage.setItem("error", "No Results Found");
}
function imgClick(bookID){
	location.href = "Details.jsp";
	sessionStorage.setItem("bookID", bookID);
}
function coverClick(){
	location.href = "SearchResults.jsp";
}
function loadDetails(){
	var bookID = sessionStorage.getItem("bookID")
	document.getElementById('results').innerHTML = ""
	console.log(bookID)
	$.ajax({
 		url: "https://www.googleapis.com/books/v1/volumes/" + bookID,
 		dataType:"json",
 		async: false,
        cache: false,
 		success: function(data) {
			resultsPic.innerHTML += "<img alt=\"Book Cover\" onclick=\"coverClick();\" src=\"" + data.volumeInfo.imageLinks.thumbnail + "\"><br>"
			results.innerHTML
					+= "<h3 style=\"font-size: 170%; font-style: normal;font-weight: normal;\">" + data.volumeInfo.title + "</h3>" 
					+ "<h2 style=\"font-size: 120%;\"><b><i>Author:</i> " + data.volumeInfo.authors + "</b><br></h2>"
					+ "<b><i>Publisher:</i> " + data.volumeInfo.publisher + "</b><br><br>"
					+ "<b><i>Published Date:</i> " + data.volumeInfo.publishedDate + "</b><br><br>"
					+ "<b><i>ISBN:</i> " + data.volumeInfo.industryIdentifiers[1].identifier + "</b><br><br>"
					+ "<b>Summary:</b> " + data.volumeInfo.description + "<br><br>"
					+ "<b>Rating:</b> " + data.volumeInfo.averageRating + " "
					var ratingTotal=data.volumeInfo.averageRating
					for(i = 0; i < Math.floor(data.volumeInfo.averageRating); i++){
						results.innerHTML += "<i class=\"fa fa-star\" style=\"color:orange\"></i>"
					}
			
					if(5-Math.ceil(ratingTotal*2)/2 == .5){
						results.innerHTML += "<i class=\"fas fa-star-half\" style=\"color:orange\"></i>"
						ratingTotal++;
					}

					for(i = 0; i < 5-Math.floor(ratingTotal); i++){
						results.innerHTML += "<i class=\"fa fa-star\" style=\"color:gray\"></i>"
					}

					
 		},
 		type: 'GET'
 	});
}

function searchQuery(){
    document.getElementById('results').innerHTML = ""
	var query = sessionStorage.getItem("book")
	var filter_val = sessionStorage.getItem("filter")
	var filter = ""
	if(filter_val == "Name"){
		filter="intitle:"
	} else if(filter_val == "Author"){
		filter="inauthor:"
	} else if(filter_val == "Publisher"){
		filter="inpublisher:"
	} else if(filter_val == "ISBN"){
		filter="isbn:"
	}
	var url = "https://www.googleapis.com/books/v1/volumes?q=" + query + "&max-results=10"
	console.log(filter)
	if (filter !== ""){
		url = "https://www.googleapis.com/books/v1/volumes?q=" + filter + query + "&max-results=10"
	}
 	$.ajax({
 		url: url,
 		dataType:"json",		
 		success: function(data) {
 			resultsHeading.innerHTML = "<h1 style=\"margin-left:40px;\"> Results for \"" + query + "\"\n"
 			if(data.totalItems===0){
 				noResult();
 			}
 			else{
				for(i = 0; i < data.items.length; i++){
					results.innerHTML += "<li>"
						+ "<div class=\"row\">"
							+ "<div class=\"column\" style=\"width: 30%;\">"
								+ "<img alt=\"Book Cover\" style=\"display: block;margin-left: auto;margin-right: auto;margin-top:20px;width: 40%;\" id=\"" + data.items[i].id + "\" onclick=\"imgClick(this.id);\" src=\"" + data.items[i].volumeInfo.imageLinks.thumbnail + "\"><br>"
							+ "</div>"
							+ "<div class=\"column\" style=\"width: 60%;\">"
								+ "<h3 style=\"font-size: 160%; font-style: normal;font-weight: normal;\">" + data.items[i].volumeInfo.title + "</h3>" 
								+ "<b><i>" + data.items[i].volumeInfo.authors + "</b></i><br><br>"
								+ "<b>Summary: </b>" + data.items[i].volumeInfo.description
							+ "</div>"
						+ "</div>"
					+ "</li>"
				}
 			}
 		},
 		type: 'GET'
 	});
}

function homeBtnClick(){
	location.href = "HomePage.jsp"
}
