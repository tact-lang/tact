struct OptionalStructWithDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
    qux: Address? = null;
}

contract OptionalDefaultsTest {
    data: OptionalStructWithDefaults;

    init() {
        self.data = OptionalStructWithDefaults{};
    }
}
