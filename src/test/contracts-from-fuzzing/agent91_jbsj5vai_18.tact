struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;
    d: Bool = false;
}

contract BoolDefaultsContract {
    data: BoolDefaults;

    init() {
        self.data = BoolDefaults{};
    }
}
