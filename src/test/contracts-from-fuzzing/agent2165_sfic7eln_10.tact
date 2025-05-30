struct WithDefaults {
    a: Int = 42;
    b: Bool = false;
    c: String = "default";
}

contract Test10 {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}