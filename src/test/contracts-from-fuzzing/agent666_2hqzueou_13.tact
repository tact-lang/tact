struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
}

contract DefaultsFieldInit {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{};
    }
}