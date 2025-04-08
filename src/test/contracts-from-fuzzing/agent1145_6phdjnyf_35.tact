struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptionalWithDefaultsTest {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}
