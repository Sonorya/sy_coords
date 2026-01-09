$(document).ready(function(){
    window.addEventListener('message', function(event) {
        if (event.data.action === "copy") {
            const node = document.createElement('textarea');
            node.value = event.data.text;
            document.body.appendChild(node);
            
            node.select();
            document.execCommand('copy');
            
            document.body.removeChild(node);
        }
    });
});