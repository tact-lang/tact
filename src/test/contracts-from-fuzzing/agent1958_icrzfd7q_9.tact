struct WithDefaults {
    x: Int = 1;
    y: Bool = false;
    z: String = "hi";
}

contract DefaultVals {
    state: WithDefaults;

    init() {
        self.state = WithDefaults{};
    }
}
