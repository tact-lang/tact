struct S1 {
    a: Int;
    b: Bool;
    c: String;
}

struct S2 {
    s1: S1;
    x: Int;
}

contract NestedStructChain {
    s2: S2;

    init() {
        self.s2 = S2{
            s1: S1{ a:1, b:true, c:"x" },
            x: 42
        };
    }
}