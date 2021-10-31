<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>

<body>
        {if !($COOKIE)}
            <div class="b-popup-b" id="popup1">
                <div class="b-popup-content">
                    <div class = "birthday"> 
                        <p>
                            <label class="TextForBirthday" for="date">{__("ageverificationwebsite.birthdaydate")}</label>
                            <input type="date" name="date" id="date"/>
                        </p>
                        <p>
                            <button class="" id="VerificationAge" name = "" >{__("ageverificationwebsite.send")}</button>
                        </p>
                    </div> 
                </div>  
            </div>        
            <div class="b-popup-b" id="popup2">
                <div class="b-popup-content">
                    <div class = "ban"> 
                        <p class= "TextForBan">
                            {__("ageverificationwebsite.accsessdenied")}
                        </p>
                    </div> 
                </div>  
            </div>
        {/if}
        {if $COOKIE == "fghytuuyjuyk794156h1j"}
                    <div class="b-popup-b">
                <div class="b-popup-content">
                    <div class = "ban"> 
                        <p class= "TextForBan">
                            {__("ageverificationwebsite.accsessdenied")}
                        </p>
                    </div> 
                </div>  
            </div>
        {/if}        
</body>

</html>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    
    $(document).ready(function(){
        var dtToday = new Date();
        var month = dtToday.getMonth()+1;
        var day = dtToday.getDate();
        var year = dtToday.getFullYear();

        if(month < 10)
            month = '0' + month.toString();
        if(day < 10)
            day = '0' + day.toString();
    
        $('#date').attr('max', year + '-' + month + '-' + day);
        $('#date').attr('value', year + '-' + month + '-' + day);
        PopUpHide("#popup2");
        console.log(document.cookie);
    });


    function PopUpHide(popup){
        $(popup).hide();
    }

    function PopUpShow(popup){
        $(popup).show();
    }


    $(document).on('click', '#VerificationAge', function(){
    var date = $('#date').val();

    $.ajax({
    url: 'index.php',
    type: 'POST',
    data: {
        'date': date, 
    },
    success: function(data){
        if (data != 18){
            PopUpHide("#popup1");
            PopUpShow("#popup2");
            } else {
            PopUpHide("#popup1");
            }
    },
        error: function(){
        console.log('ERROR');
        }
    })

    })

</script>
