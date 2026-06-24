struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: String? = null;
}

contract OptDefaultsTest {
    data: OptionalWithDefaults;
    init() {
        self.data = OptionalWithDefaults{};
    }
}