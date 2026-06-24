struct BoolDefaults {
    on: Bool = true;
    off: Bool = false;
}

contract BoolVals {
    b: BoolDefaults;

    init() {
        self.b = BoolDefaults{};
    }
}