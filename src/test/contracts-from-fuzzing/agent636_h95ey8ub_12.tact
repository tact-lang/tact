struct WithDefault {
    x: Int = 5;
    y: Bool = true;
}

contract StructDefaults {
    s: WithDefault;

    init() {
        self.s = WithDefault{};
    }
}