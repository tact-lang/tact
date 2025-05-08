struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}