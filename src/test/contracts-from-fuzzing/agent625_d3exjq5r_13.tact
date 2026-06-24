struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "hello";
}

contract Test {
    data: WithDefaults;

    init() {
        self.data = WithDefaults {};
    }
}