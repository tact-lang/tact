struct S1 {
    a: Int;
    b: Int?;
    c: Int;
}

struct S2 {
    s1: S1;
    s1opt: S1?;
}

contract StructMixOpt {
    data: S2;
    init() {
        self.data = S2 {
            s1: S1{ a:1, b: null, c:2 },
            s1opt: null
        };
    }
}