struct StructWithBoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract StructBoolDefaults {
    val: StructWithBoolDefaults;

    init() {
        self.val = StructWithBoolDefaults{};
    }
}