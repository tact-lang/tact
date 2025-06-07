struct WithDefaults {
    a: Int = 99;
    b: Bool = true;
    c: String = "hi";
}

contract StructDefaults {
    s: WithDefaults = WithDefaults{};

    init() {
        self.s = WithDefaults{ a: 42, b: false, c: "set" };
    }
}