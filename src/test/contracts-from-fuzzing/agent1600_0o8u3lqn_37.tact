struct A {
    op: Int?;
}

contract OptionalStructField {
    a: A?;

    init() {
        self.a = null;
    }
}