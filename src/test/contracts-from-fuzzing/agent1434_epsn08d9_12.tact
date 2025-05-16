struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    b: Int;
    c: Bool;
}

contract Test {
    outer: S2 = S2{
        s1: S1{ a: 123 },
        b: 456,
        c: false
    };

    receive() {}
}