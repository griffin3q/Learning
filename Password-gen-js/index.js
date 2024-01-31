var passLength = 20;
var password = "";
const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

function generate()
{
    for(i=0;i<passLength;i++)
    {
        var pick = 0;
        pick = Math.floor(Math.random()*chars.length);
        password=password+chars[pick];
    }
    console.log("Generated password: "+password);
}

generate();

