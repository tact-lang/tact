struct WithDefaults {
    x: Int = 5;
    y: Bool = true;
    s: String = "hello";
}

contract DefaultsTest {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}