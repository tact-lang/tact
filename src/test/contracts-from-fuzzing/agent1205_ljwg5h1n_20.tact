struct S {
    a: Int;
}

contract OptionalStructField {
    s: S?;
    init() {
        self.s = null;
    }
}