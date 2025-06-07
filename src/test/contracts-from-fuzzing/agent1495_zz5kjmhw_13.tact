struct WithBoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool?;
}

contract BoolDefaultsTest {
    vals: WithBoolDefaults;

    init() {
        self.vals = WithBoolDefaults{};
    }
}
