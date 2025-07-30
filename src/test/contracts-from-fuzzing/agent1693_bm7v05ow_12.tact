struct InlineDefaults {
    foo: Int = 5;
    bar: Bool = false;
    baz: String = "baz";
}

contract StructDefaultsTest {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}