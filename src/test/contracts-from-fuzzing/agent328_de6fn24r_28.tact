struct WithBoolDefaults {
    a: Bool = false;
    b: Bool = true;
}

contract Test {
    wbd: WithBoolDefaults;
    init() {
        self.wbd = WithBoolDefaults{};
    }
}