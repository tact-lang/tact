struct S2 {
    a: Int;
}

struct S1 {
    s2: S2?;
}

contract OptionalNestedStruct {
    param: S1;

    init() {
        self.param = S1{ s2: null };
    }
}