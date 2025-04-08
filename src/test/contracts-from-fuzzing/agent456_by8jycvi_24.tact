struct BoolDefault {
    b: Bool = true;
}

contract BoolDefaults {
    b1: Bool = false;
    b2: BoolDefault;

    init() {
        self.b1 = true;
        self.b2 = BoolDefault{};
    }
}