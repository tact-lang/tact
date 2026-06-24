struct S {
    a: Int;
    b: String;
}

contract OptionalStructField {
    s: S?;

    init() {
        self.s = null;
    }
}