struct StructWithBoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract Test {
    s: StructWithBoolDefaults;

    init() {
        self.s = StructWithBoolDefaults{};
    }
}
