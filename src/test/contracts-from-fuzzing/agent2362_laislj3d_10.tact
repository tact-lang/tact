struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultsStructTest {
    f: WithDefaults;

    init() {
        self.f = WithDefaults{};
    }
}