struct BoolDefaults {
    x: Bool = true;
    y: Bool = false;
}

contract BoolDefaultStruct {
    val: BoolDefaults;

    init() {
        self.val = BoolDefaults{};
    }
}