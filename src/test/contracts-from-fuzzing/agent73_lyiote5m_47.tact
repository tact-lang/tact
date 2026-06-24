struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
}

contract Test {
    data: WithDefaults = WithDefaults{};

    init() {
        self.data = WithDefaults{};
    }
}