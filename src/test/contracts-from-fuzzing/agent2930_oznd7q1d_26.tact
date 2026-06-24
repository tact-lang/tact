struct StructWithBoolDefaults {
    b1: Bool = true;
    b2: Bool = false;
}

contract BoolDefaults {
    s: StructWithBoolDefaults;

    init() {
        self.s = StructWithBoolDefaults{};
    }
}
