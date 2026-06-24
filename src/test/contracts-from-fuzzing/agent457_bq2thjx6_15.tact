struct BoolDefaults {
    b1: Bool = false;
    b2: Bool = true;
}

contract Test {
    data: BoolDefaults;
    init() {
        self.data = BoolDefaults{};
    }
}