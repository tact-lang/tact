struct WithDefaults {
    x: Int = 1;
    y: Bool = true;
    z: String = "ok";
}

contract UseDefaults {
    data: WithDefaults = WithDefaults{};
    init() {
        self.data = WithDefaults{};
    }
}
