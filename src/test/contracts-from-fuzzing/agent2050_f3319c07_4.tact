struct WithDefaults {
    x: Int = 10;
    y: Bool = true;
    s: String = "test";
    opt: Address? = null;
}

contract DefaultVals {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}