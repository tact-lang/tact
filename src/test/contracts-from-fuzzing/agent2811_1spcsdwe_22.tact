struct S {
    a:Int;
    b:Bool;
}

contract InitDefault {
    s:S = S{a:5,b:true};
}