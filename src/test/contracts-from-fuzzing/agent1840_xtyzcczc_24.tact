struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;
}

contract BoolDef {
    field: BoolDefaults;
    init() {
        self.field = BoolDefaults{};
    }
}