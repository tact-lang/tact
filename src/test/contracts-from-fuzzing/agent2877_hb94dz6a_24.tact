struct S {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    s: S?;

    init() {
        self.s = null;
    }
}