struct Nested {
    s1: S1;
    s2: S2;
}

struct S1 {
    f1: Bool;
    f2: Int?;
}

struct S2 {
    f3: Bool?;
    f4: Int;
}

contract Test {
    nested: Nested;
    init() {
        self.nested = Nested{
            s1: S1{f1: true, f2: null},
            s2: S2{f3: null, f4: 123}
        };
    }
}