struct WithDefaults {
    x: Int = 42;
    y: String = "default";
    z: Bool = true;
}

contract FuzzTest {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}
