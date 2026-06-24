struct WithDefaults {
    x: Int = 5;
    y: String = "default";
    z: Bool = true;
}

contract DefaultVals {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}