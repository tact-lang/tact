struct WithDefaults {
    x: Int = 5;
    y: Bool = true;
    str: String = "default";
}

contract DefaultStructInState {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}