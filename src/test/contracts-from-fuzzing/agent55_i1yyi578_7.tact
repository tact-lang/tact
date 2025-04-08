struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "test";
}

contract TestContract {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{};
    }
}