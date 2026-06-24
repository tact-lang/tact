struct S {
    a: Int;
    b: String;
}

contract OptionalWhole {
    s: S?;
    init() {
        self.s = null;
    }
}