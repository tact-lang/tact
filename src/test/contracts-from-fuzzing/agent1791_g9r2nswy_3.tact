struct S1 {
    x: Int;
}

struct S2 {
    s1: S1;
    s1opt: S1?;
}

contract Test4 {
    foo: S2 = S2{
        s1: S1{ x: 42 },
        s1opt: null
    };
    init() {}
}
