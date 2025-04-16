struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "ok";
}

contract Test {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}