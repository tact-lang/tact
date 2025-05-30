struct S1 {
    i1: Int;
}

struct S2 {
    s1: S1;
    b: Bool;
}

contract StructWithNestedAndOptional {
    s2: S2?;

    init() {
        self.s2 = null;
    }
}