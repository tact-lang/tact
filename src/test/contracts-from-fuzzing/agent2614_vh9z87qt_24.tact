struct BoolDefaults {
    b1: Bool = true;
    b2: Bool = false;
}

contract BoolDefaultsContract {
    data: BoolDefaults;

    init() {
        self.data = BoolDefaults{};
    }
}