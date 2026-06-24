struct BoolDefaults {
    a: Bool = false;
    b: Bool = true;
}

contract BoolDefaultsStorage {
    data: BoolDefaults;

    init() {
        self.data = BoolDefaults{};
    }
}