struct OptionalNestedDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    optData: OptionalNestedDefaults;

    init() {
        self.optData = OptionalNestedDefaults{};
    }
}