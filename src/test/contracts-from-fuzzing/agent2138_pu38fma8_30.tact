struct NestedDefaults {
    m: Int = 1;
    n: Bool? = null;
}

contract WithNestedDef {
    nd: NestedDefaults;

    init() {
        self.nd = NestedDefaults{};
    }
}