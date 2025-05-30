struct OptionalNestedDefaults {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;
}

contract OptionalDefaultsContract {
    data: OptionalNestedDefaults;

    init() {
        self.data = OptionalNestedDefaults{};
    }
}