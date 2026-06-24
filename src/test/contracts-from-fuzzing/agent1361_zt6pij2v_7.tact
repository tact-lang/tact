struct S1 {
    a: Int;
    b: Int?;
    c: Int;
}

struct S2 {
    s1: S1;
    s2: S1?;
}

contract NestedOptionalTest {
    nested: S2;
    init() {
        self.nested = S2{
            s1: S1{a:1,b:2,c:3},
            s2: null
        };
    }
}
