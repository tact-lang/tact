struct BoolDefaults {
    b1: Bool = false;
    b2: Bool = true;
}

contract Test {
    bd: BoolDefaults;

    init() {
        self.bd = BoolDefaults{};
    }
}