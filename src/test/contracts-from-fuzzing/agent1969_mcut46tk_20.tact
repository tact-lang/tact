struct WithDefaults {
    a: Int = 42;
    b: Bool = true;
}

contract DefaultsContract {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{};
    }
}