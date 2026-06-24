struct WithBoolDefaults {
    a: Bool = false;
    b: Bool = true;
    c: Bool = false;
    d: Bool = true;
    e: Bool = false;
}

contract StructBoolDefaults {
    s: WithBoolDefaults;

    init() {
        self.s = WithBoolDefaults{};
    }
}