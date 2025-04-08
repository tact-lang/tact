struct BoolDefaults {
    a: Bool = false;
    b: Bool = true;
}

contract InitDefaults {
    data: BoolDefaults;

    init() {
        self.data = BoolDefaults{};
    }
}