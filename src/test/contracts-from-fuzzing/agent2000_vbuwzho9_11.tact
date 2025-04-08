struct WithDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "Hello";
}

contract DefaultsTest {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}