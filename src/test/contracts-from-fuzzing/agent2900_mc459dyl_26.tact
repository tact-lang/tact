struct DefaultsOpt {
    a: Int = 5;
    b: Bool = true;
    c: String? = null;
    d: Int? = null;
}

contract WithDefaults {
    s: DefaultsOpt;

    init() {
        self.s = DefaultsOpt{};
    }
}
