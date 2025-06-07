struct S {
    a: Int;
    b: Bool;
}

contract OptionalStruct {
    s: S?;

    init() {
        self.s = null;
    }
}
