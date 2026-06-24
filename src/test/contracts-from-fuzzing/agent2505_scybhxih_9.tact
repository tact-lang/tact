struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultStructFields {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}