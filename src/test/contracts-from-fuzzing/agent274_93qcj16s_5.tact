struct WithDefaults {
    flag: Bool = true;
    count: Int = 42;
    name: String = "default";
}

contract DefaultsTest {
    param: WithDefaults;

    init() {
        self.param = WithDefaults{};
    }
}