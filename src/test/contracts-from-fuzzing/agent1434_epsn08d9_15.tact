struct Many {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Int;
    x7: Int;
    x8: Int;
    x9: Int;
    x10: Int;
    x11: Bool;
    x12: Bool;
    x13: Bool;
    x14: Bool;
    x15: Bool;
    s1: S1;
    s2: S2;
}

struct S1 {
    a: Int;
    b: String;
}

struct S2 {
    c: Bool;
    d: Int;
}

contract Test {
    payload: Many = Many{
        x1:1,x2:2,x3:3,x4:4,x5:5,x6:6,x7:7,x8:8,x9:9,x10:10,
        x11:true,x12:false,x13:true,x14:false,x15:true,
        s1: S1{ a:11, b:"b" },
        s2: S2{ c:false, d:12 }
    };

    receive() {}
}