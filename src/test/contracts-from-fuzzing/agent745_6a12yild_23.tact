struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool? = null;
}

contract BoolDefaultsStorage {
    data: BoolDefaults;

    init() {
        self.data = BoolDefaults{};
    }
}