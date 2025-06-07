struct WithDefaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "default";
}

contract DefaultsStructTest {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}