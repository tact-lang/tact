struct Outer {
    a: Int;
    b: Inner;
}

struct Inner {
    c: Int;
    d: Innermost;
}

struct Innermost {
    val: Bool;
}

contract MultiDeep {
    field: Outer = Outer{
        a:1,
        b: Inner{ c:2, d: Innermost{ val:true } }
    };
}