struct WithDefaults {
    x: Int = 42;
    y: Bool = false;
    s: String = "default";
}

contract DefaultsTest {
    vals: WithDefaults;

    init() {
        self.vals = WithDefaults{};
    }
}