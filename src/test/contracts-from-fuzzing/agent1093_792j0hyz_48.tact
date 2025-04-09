struct OptDefaults {
    a: Int? = null;
    b: Bool? = null;
}

contract TestOptDefaults {
    x: OptDefaults;

    init() {
        self.x = OptDefaults{};
    }
}