struct S {
    a: Int;
    b: Bool;
}

contract NullableStruct {
    s: S?;
    n: Int;

    init() {
        self.s = null;
        self.n = 99;
    }
}
