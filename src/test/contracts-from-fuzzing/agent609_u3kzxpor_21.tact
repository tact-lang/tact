struct S1 {
    foo: Int;
}

struct S2 {
    s1: S1?;
    flag: Bool;
}

contract NullNestedStruct {
    data: S2;

    init() {
        self.data = S2 { s1: null, flag: true };
    }
}