struct OptionalEmptyDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptionalEmptyDefaultsContract {
    data: OptionalEmptyDefaults;

    init() {
        self.data = OptionalEmptyDefaults{};
    }
}