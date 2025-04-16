struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
}

contract WithDef {
    d: ManyDefaults;

    init() {
        self.d = ManyDefaults{};
    }
}