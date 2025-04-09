struct OptionalStringDefaults {
    s1: String? = null;
    s2: String? = null;
}

contract OptionalStringDefaultsTest {
    data: OptionalStringDefaults;

    init() {
        self.data = OptionalStringDefaults{};
    }
}