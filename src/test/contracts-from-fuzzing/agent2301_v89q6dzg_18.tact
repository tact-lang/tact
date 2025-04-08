struct OptionalDefaults {
    intOpt: Int? = null;
    boolOpt: Bool? = null;
}

contract OptDefaultsTest {
    data: OptionalDefaults;

    init() {
        self.data = OptionalDefaults{};
    }
}