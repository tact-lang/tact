struct S {
    a: Int;
}

contract OptionalStructField {
    foo: S?;

    init() {
        self.foo = null;
    }
}