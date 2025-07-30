struct OptWithDefaults {
    oi: Int? = null;
    ob: Bool? = null;
    os: String? = null;
}

contract OptDefaultsTest {
    f: OptWithDefaults;
    init() {
        self.f = OptWithDefaults{};
    }
}