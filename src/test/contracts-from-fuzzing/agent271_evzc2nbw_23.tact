struct OptDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract OptDefaultsTest {
    data: OptDefaults;

    init() {
        self.data = OptDefaults{};
    }
}
