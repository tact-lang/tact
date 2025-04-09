struct WithDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsTest {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}