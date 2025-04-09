struct X {
    intF: Int;
    boolF: Bool;
}

contract OptionalStructOptField {
    foo: X?;

    init() {
        self.foo = null;
    }
}