struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = false;
    c: String? = null;
}

contract TestContract {
    f: OptionalWithDefaults;

    init() {
        self.f = OptionalWithDefaults{};
    }
}