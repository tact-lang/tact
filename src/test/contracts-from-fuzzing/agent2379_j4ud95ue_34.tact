struct S {
    a: Int;
    b: String?;
    c: Bool?;
}

contract OptionalStructField {
    f: S?;

    init() {
        self.f = null;
    }
}