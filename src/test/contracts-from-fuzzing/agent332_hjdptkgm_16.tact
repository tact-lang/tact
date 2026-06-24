struct WithDefaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "abc";
}

contract TestContract {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}