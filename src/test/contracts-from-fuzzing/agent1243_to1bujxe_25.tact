struct OptWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
}

contract Test {
    f: OptWithDefaults;
    init() {
        self.f = OptWithDefaults{};
    }
}