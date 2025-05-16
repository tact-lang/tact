struct WithBoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract BoolDefaultsTest {
    data: WithBoolDefaults;

    init() {
        self.data = WithBoolDefaults{};
    }
}
