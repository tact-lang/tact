contract Test {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}

struct WithDefaults {
    x: Int = 10;
    y: Int?;
    z: String = "hello";
}