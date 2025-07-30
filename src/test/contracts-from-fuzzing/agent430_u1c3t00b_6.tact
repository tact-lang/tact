struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract Test {
    data: BoolDefaults;

    init() {
        self.data = BoolDefaults{};
    }
}