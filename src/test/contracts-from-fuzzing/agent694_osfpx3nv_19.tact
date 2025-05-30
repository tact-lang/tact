struct HasOptDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract TestContract {
    s: HasOptDefaults;

    init() {
        self.s = HasOptDefaults{};
    }
}