struct WithBoolDefaults {
    f1: Bool = true;
    f2: Bool = false;
}

contract StructDefaultBools {
    s: WithBoolDefaults;

    init() {
        self.s = WithBoolDefaults{};
    }
}