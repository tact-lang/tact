struct WithDefaults {
    x: Int = 0;
    y: Int = 1;
    z: Int = 2;
}

contract DefaultsTest {
    values: WithDefaults;

    init() {
        self.values = WithDefaults{};
    }
}