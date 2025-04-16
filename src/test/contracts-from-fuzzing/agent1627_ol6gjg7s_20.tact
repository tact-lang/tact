struct StructWithBoolDefaults {
    flag1: Bool = false;
    flag2: Bool = true;
}

contract BoolDefaultsContract {
    data: StructWithBoolDefaults;

    init() {
        self.data = StructWithBoolDefaults{};
    }
}
