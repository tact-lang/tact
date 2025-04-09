struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract DefaultsBool {
    flags: BoolDefaults;

    init() {
        self.flags = BoolDefaults{};
    }
}
