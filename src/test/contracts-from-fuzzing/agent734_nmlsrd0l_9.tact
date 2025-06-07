struct Complex {
    a: Int;
    b: String;
}

contract OptionalComplex {
    foo: Complex?;

    init() {
        self.foo = null;
    }
}
