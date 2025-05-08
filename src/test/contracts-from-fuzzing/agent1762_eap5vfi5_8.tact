struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    s1: S1;
}

contract NestedDefaults {
    data: S2;
    init() {
        self.data = S2{
            b: 123,
            s1: S1{ a: 456 }
        };
    }
}