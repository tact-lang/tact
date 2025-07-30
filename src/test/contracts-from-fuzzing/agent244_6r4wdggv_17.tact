struct WithDefaults {
    a: Int = 10;
    b: Bool = false;
    s: String = "hello";
}

contract DefaultsStructTest {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{};
    }
}