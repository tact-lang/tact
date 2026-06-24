struct OptionalWithDefaults {
    strOpt: String? = null;
    intOpt: Int? = null;
    boolOpt: Bool? = null;
}

contract TestContract {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}
