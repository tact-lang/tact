struct WithDefaults {
    x: Int = 1;
    y: Bool = true;
    z: String = "default";
}

contract TestContract {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{};
    }
}
