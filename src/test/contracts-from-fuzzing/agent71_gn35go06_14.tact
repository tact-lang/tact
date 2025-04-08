struct BoolDefaults {
    b1: Bool = true;
    b2: Bool = false;
}

contract TestContract {
    flags: BoolDefaults;

    init() {
        self.flags = BoolDefaults{};
    }
}