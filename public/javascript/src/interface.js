$(document).ready(function() {
    update()
    update()
    update()
    $('#input_result').submit(function(e) {
        e.preventDefault();
        $('#input_result').ajaxSubmit({url: '/input_result', type: 'post'});
        update();
    });

    function update() {
        $.get('/update', function(res){
            var data = JSON.parse(res);
            console.log(res);
            if(data.status === 200) {
                $('#total_pins').text(data.player_points);
                $('#bonus').text(data.player_bonus);
                $('#overall').text(data.player_total);                 
            };
        });
    };
    
});
