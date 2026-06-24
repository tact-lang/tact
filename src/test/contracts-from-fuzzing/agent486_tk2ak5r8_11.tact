struct OptWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    s: String? = null;
}

contract TestOptWithDefaults {
    data: OptWithDefaults;

    init() {
        self.data = OptWithDefaults{};
    }
}