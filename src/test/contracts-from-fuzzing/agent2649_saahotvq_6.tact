struct WithDefaults {
    x: Int = 50;
    y: Bool = true;
    s: String = "default";
}

contract DefaultsTest {
    info: WithDefaults;

    init() {
        self.info = WithDefaults{};
    }
}