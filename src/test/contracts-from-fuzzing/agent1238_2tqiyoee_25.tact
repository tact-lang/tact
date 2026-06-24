struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
}

contract OptWithNullDefaultsTest {
    d: OptionalDefaults;

    init() {
        self.d = OptionalDefaults{};
    }
}