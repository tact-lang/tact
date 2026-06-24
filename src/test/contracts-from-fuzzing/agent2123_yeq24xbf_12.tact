contract OptionalStructField {
    data: S?;

    init() {
        self.data = null;
    }
}

struct S {
    a: Int;
    b: Bool;
}
