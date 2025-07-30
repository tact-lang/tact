struct WithStringDefaults {
    a: String = "hello";
    b: String = "world";
}

contract Test {
    wsd: WithStringDefaults;
    init() {
        self.wsd = WithStringDefaults{};
    }
}