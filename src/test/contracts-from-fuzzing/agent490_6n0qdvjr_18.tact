struct S {
    a: Int;
    b: Int?;
}

contract OptionalField {
    s: S?;
    init() {
        self.s = null;
    }
}