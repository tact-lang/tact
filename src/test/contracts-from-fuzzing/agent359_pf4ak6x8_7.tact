struct WithDefaults {
    x: Int = 42;
    y: Bool = true;
    z: String = "hello";
}

contract DefaultsTest {
    val: WithDefaults;
    init() {
        self.val = WithDefaults{};
    }
}