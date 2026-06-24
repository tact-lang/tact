struct WithDefaults {
    i: Int = 7;
    b: Bool = false;
    s: String = "hi";
}

contract Test {
    f: WithDefaults;

    init() {
        self.f = WithDefaults{};
    }
}
