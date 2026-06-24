struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "default";
}

contract DefaultStructFields {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }

    receive() {
        self.data = self.data;
    }
}