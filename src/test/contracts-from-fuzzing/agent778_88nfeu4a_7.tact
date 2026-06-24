struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = null;
}

contract DefaultStructFields {
    data: WithDefaults = WithDefaults{};

    init() {
        self.data = WithDefaults{};
    }
}