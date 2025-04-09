struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
    s: String = "default";
}

contract DefaultsTest {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{};
    }
}