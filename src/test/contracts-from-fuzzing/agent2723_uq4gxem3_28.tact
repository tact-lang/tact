struct IntDefaults {
    a: Int = 1;
    b: Int? = null;
}

contract DefaultsAndOpts {
    f: IntDefaults;
    init() {
        self.f = IntDefaults{};
    }
}