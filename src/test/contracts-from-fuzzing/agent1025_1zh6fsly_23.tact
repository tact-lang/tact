struct Compose {
    a:Int;
    b:Bool;
    c:String;
}

contract ComposeDefaults {
    c: Compose = Compose{a:4,b:true,c:"hi"};
}
