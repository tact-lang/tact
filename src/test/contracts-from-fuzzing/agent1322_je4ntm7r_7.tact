struct WithDefault {
    a: Int = 10;
    b: Bool = true;
    c: String = "default";
}

contract TestDefaults {
    data: WithDefault;

    init() {
        self.data = WithDefault{};
    }
}