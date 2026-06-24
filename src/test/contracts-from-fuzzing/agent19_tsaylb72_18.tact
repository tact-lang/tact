struct WithDefaults {
    x: Int = 4;
    y: Bool = false;
    z: String = "hi";
}

contract DefaultsOnStruct {
    s: WithDefaults = WithDefaults{};

    init() {
        self.s = WithDefaults{};
    }
}
