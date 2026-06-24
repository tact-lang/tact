struct OptionalEmptyDefaults {
    s: String? = null;
}

contract OptionalEmptyDefaultsContract {
    f: OptionalEmptyDefaults;

    init() {
        self.f = OptionalEmptyDefaults{};
    }
}