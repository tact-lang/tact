struct X {
    a: Int;
    b: Bool;
}

struct Y {
    x: X;
    s: String;
    opt: String?;
}

contract NestedAny {
    y: Y = Y { x: X{ a:5, b:true }, s:"abc", opt:null };
}