struct OptDefaults {
    x: Int? = null;
    y: Bool? = null;
}

contract StructOptDefaults {
    s: OptDefaults;

    init() {
        self.s = OptDefaults{};
    }
}