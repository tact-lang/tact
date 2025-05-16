struct WithDefaults {
    a: Int = 5;
    b: String = "hi";
    c: Bool = true;
}

contract DefaultsTest {
    s: WithDefaults = WithDefaults{};

    init() {
        self.s = WithDefaults{
            a: 42,
            b: "hello",
            c: false
        };
    }
}