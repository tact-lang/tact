struct S {
    a: Int;
    b: Bool;
    c: Int?;
}

contract DefaultInit {
    f: S = S{a:3,b:false,c:null};
}