struct StructBoolDefaults {
    on: Bool = false;
    off: Bool = true;
}

contract BoolDefaultsInStruct {
    val: StructBoolDefaults;

    init() {
        self.val = StructBoolDefaults{};
    }
}