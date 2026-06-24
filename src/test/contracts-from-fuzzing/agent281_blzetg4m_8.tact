struct OptionalNestedDefaults {
    foo: Int? = null;
    bar: Bool? = null;
}

contract OptDefaultsStorage {
    data: OptionalNestedDefaults;

    init() {
        self.data = OptionalNestedDefaults{};
    }
}