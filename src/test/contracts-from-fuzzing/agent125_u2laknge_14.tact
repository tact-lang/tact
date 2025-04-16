struct OptionalWithDefaults {
    s: String? = null;
    flag: Bool? = true;
    num: Int? = 0;
}

contract OptDefaultsTest {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}