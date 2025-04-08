struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    b: Int;
}

contract OptNestedFields {
    optional_s2: S2?;

    init() {
        self.optional_s2 = S2{
            s1: S1{ a: 1 },
            b: 2
        };
    }
}