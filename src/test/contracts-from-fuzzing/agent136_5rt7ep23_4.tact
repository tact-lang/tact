struct WithDefaults {
    a: Int = 42;
    b: Bool = true;
}

contract DefaultsTest {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}