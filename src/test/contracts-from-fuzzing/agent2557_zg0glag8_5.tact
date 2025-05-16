struct WithDefaults {
    foo: Int = 42;
    bar: Bool = false;
}

contract TestContract {
    data: WithDefaults;
    init() {
        self.data = WithDefaults{};
    }
}