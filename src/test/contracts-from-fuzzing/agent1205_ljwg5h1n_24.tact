struct S1 {
    val1: Int;
    val2: Bool;
}

struct S2 {
    nested: S1;
    optionalNested: S1?;
}

contract TestContract {
    s2: S2;

    init() {
        self.s2 = S2{
            nested: S1{val1: 5, val2: true},
            optionalNested: null
        };
    }
}