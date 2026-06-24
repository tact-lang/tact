struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "default";
}

contract StructDefaultTest {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}