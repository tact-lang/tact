struct InlineDefaults {
    foo: Int = 42;
    bar: String = "bar";
    baz: Bool = true;
}

contract DefaultsTest {
    field: InlineDefaults;

    init() {
        self.field = InlineDefaults{};
    }
}
