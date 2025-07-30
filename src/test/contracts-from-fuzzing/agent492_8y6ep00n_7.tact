struct WithDefaults {
    a: Int = 42;
    b: Bool = false;
    c: String = "test";
}

contract TestContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}