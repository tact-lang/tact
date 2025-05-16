struct BoolDefaults {
    b1: Bool = true;
    b2: Bool = false;
}

contract BoolDefaultsContract {
    s: BoolDefaults;

    init() {
        self.s = BoolDefaults{};
    }
}