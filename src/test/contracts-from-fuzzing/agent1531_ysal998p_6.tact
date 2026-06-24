struct WithDefaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "ok";
}

contract Test {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}
