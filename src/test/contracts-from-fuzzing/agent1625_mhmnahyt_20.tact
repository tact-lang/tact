struct WithDefault {
    a: Int = 42;
    b: Bool = true;
}

contract StructWithDefaults {
    s: WithDefault;

    init() {
        self.s = WithDefault{};
    }
}
