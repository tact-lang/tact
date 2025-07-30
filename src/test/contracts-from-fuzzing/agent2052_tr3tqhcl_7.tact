struct WithDefaults {
    val1: Int = 42;
    val2: String = "hi";
    val3: Bool = false;
}

contract DefaultsStructTest {
    info: WithDefaults;

    init() {
        self.info = WithDefaults{};
    }
}