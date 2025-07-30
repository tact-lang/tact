struct WithDefaults {
    a: Int = 5;
    b: Int = 10;
    c: Bool = false;
}

contract TestContract {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}
