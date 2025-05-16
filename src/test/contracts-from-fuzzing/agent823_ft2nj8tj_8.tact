struct WithDefaults {
    a: Int = 42;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultVals {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}