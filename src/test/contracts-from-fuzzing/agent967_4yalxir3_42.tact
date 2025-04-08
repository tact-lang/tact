struct OptionalDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
    d: Address? = null;
}

contract OptDefaultsTest {
    s: OptionalDefaults;

    init() {
        self.s = OptionalDefaults{};
    }
}