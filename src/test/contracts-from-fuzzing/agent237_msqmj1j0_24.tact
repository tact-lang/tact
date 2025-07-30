struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract DefaultsBool {
    val: BoolDefaults;
    init() {
        self.val = BoolDefaults{};
    }
}