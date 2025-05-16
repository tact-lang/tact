struct OptDefaults {
    x: Int? = null;
    y: Bool? = null;
}

contract OptDefaultsTest {
    data: OptDefaults;

    init() {
        self.data = OptDefaults{};
    }
}