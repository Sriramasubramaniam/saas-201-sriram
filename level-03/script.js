// This is a closure function https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-closure-b2f0d2152b36
(function() {
  var initialize = function() {
    /*
      1. Add all your event bindings here. Please avoid binding events inline and add your event listeners here.

      onSubmit callback
      disableDuplicateSecondaryDepartment callback,...
    */
    var form_submit=document.forms.item(0);
    form_submit.addEventListener('submit', onSubmit);
    department1.addEventListener('change', disableDuplicateSecondaryDepartment);
  };
  var input = document.getElementsByTagName("input");
  var name = input[0];
  var phno = input[1];
  var email = input[2];
  var select = document.getElementsByTagName("select");
  var department1 = select[0];
  var department2 = select[1];
  var disableDuplicateSecondaryDepartment = function() {
    // 2. in department2, Should disable the option selected in department1
    for(let i=0;i<department2.length;i++){
        if(department2[i].value===department1.value){
            department2[i].disabled=true;
          }
        else{
            department2[i].disabled=false;
          }
      }
  }
  var constructData = function() {
    var data = {};
    // 3. Construct data from the form here. Please ensure that the keys are the names of input elements
    data[name.name]=name.value;
    data[phno.name]=phno.value;
    data[email.name]=email.value;
    data[department1.name]=department1.value;
    data[department2.name]=department2.value;
    return data;
  }

  var validateResults = function(data) {
    var isValid = true;
    // var check = email.value;
    var special_chars = /[ !#$%^&*()_+\-=\[\]{};':"\\|,<>\/?]/;
if(data[name.name].length>100){
      // alert("Name must not exceed 100 characters");
      isValid=false;
    }
    else if(data[phno.name].length>10){
      // alert("Number must not exceed 10 digits");
      isValid=false;
    }
    else if(!data[email.name].endsWith("@college.edu")){
      // alert("Invalid Email ID");
      isValid=false;
    }
    else if(special_chars.test(data[email.name])){
      // alert("special charcters found");
      isValid=false;
    }
    // else if (/^[.]*$/.test(check(0)) == true) {
    //   alert("Email cannot start with .");
    //   return false;
    // }
    else if(department1.value===department2.value){
	    isValid=false;
	  }

    // 4. Check if the data passes all the validations here

    return isValid;
  };

  var onSubmit = function() {
    // 5. Figure out how to avoid the redirection on form submit
    event.preventDefault();
    var data = constructData();

    if (validateResults(data)) {
      printResults(data);
    } else {
      var resultsDiv = document.getElementById("results");
      resultsDiv.innerHTML = '';
      resultsDiv.classList.add("hide");
    }
  };

  var printResults = function(data) {
    var constructElement = function([key, value]) {
      return `<p class='result-item'>${key}: ${value}</p>`;
    };

    var resultHtml = (Object.entries(data) || []).reduce(function(innerHtml, keyValuePair) {
      debugger
      return innerHtml + constructElement(keyValuePair);
    }, '');
    var resultsDiv = document.getElementById("results");
    resultsDiv.innerHTML = resultHtml;
    resultsDiv.classList.remove("hide");
  };

  /*
    Initialize the javascript functions only after the html DOM content has loaded.
    This is to ensure that the elements are present in the DOM before binding any event listeners to them.
  */
  document.addEventListener('DOMContentLoaded', initialize);
})();
