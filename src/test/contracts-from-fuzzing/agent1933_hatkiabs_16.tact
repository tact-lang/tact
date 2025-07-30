struct S {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    field: S?;

    init() {
        self.field = null;
    }
}