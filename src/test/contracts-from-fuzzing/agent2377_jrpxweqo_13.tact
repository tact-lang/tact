struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;
}

contract DefaultedBools {
    flags: BoolDefaults;

    init() {
        self.flags = BoolDefaults{};
    }
}