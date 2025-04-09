struct WithDefaults {
    x: Int = 1;
    y: Bool = true;
    z: String = "hello";
}

contract DefaultVals {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}