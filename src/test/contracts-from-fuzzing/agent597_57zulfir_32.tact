struct S {
    a: Int;
    b: Bool;
}

contract NullableStruct {
    s: S?;
    init() {
        self.s = null;
    }
}