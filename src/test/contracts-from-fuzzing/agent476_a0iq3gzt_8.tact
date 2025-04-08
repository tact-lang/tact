struct WithDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "abc";
    d: Int?;
}

contract Test {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}
