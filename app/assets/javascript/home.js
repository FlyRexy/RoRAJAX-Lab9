function show_result(data){
    var result = document.getElementById("result");
    var result_area = document.getElementById("result_area")
    let arr = data.value
    let maxi = data.value2
    var frm = document.forms.index_form;
    if ((frm.arr.value.match(/^\d+(\s\d+)*$/) == null) || (Number(frm.num.value) != frm.arr.value.split(' ').length)) {
        alert('Неправильный ввод');
        result.innerHTML = ""
        return false
    }
    console.log(data.value2)
    result.innerHTML = ""
    if (arr.length == 0) {
        alert("Количество отрезков равно нулю")
        return false
    }
    for (let i = 0; i < arr.length; i++) {
        result.innerHTML += '<tr>'+'<td>'+ (i+1).toString() +'</td>'+'<td>'+arr[i]+'</td>'+'</tr>'
        console.log(arr[i])
    }
    result_area.innerHTML = 'Количество отрезков равно ' + arr.length + '<br>' + 'Самый длинный из них: ' + arr[maxi]
}
$(document).ready(function(){
    $("#index_form").bind("ajax:success", function(xhr, data, status)
    {
        show_result(data)
    })
})