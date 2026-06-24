struct WithDefaults {
    a: Int = 42;
    b: Bool = true;
    c: Address? = null;
    d: String = "abc";
}

contract Test {
    data: WithDefaults;
    init() {
        self.data = WithDefaults{};
    }
}