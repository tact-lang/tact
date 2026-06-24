struct OptionalWithDefaults {
    a: Int? = null;
    b: String? = null;
}

contract OptionalDefaultsTest {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}