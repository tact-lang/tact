struct OptionalWithDefaults {
    optInt: Int? = null;
    optBool: Bool? = null;
    nonOptInt: Int = 5;
}

contract TestContract {
    field: OptionalWithDefaults;

    init() {
        self.field = OptionalWithDefaults{};
    }
}
