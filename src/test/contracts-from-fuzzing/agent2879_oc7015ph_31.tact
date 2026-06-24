struct S {
    a: Int;
    b: Bool;
}

contract Test {
    s1: S = S{a:1,b:true};
    s2: S = S{a:2,b:false};
    s3: S = S{a:3,b:true};
}