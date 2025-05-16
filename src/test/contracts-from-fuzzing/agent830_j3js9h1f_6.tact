struct OptionalDefaults {
    foo: Int? = null;
    bar: Bool? = null;
}

contract TestContract {
    testField: OptionalDefaults;

    init() {
        self.testField = OptionalDefaults{};
    }
}