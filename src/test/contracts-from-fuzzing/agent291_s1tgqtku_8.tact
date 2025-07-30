struct EmbeddedDefault {
    foo: Int = 42;
    bar: String = "str";
    baz: Bool = true;
}

contract StructWithDefaults {
    data: EmbeddedDefault;

    init() {
        self.data = EmbeddedDefault{};
    }
}