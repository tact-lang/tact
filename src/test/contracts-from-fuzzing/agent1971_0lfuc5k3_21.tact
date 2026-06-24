struct S {
    a: Int;
    b: Bool;
}

contract OptionalOfStruct {
    s: S?;

    init() {
        self.s = null;
    }
}
