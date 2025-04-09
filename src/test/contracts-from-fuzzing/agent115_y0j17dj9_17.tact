struct Complex {
    foo: Int;
    bar: String;
    baz: Bool;
}

contract ComplexNullDefaults {
    optComplex: Complex?;

    init() {
        self.optComplex = null;
    }
}