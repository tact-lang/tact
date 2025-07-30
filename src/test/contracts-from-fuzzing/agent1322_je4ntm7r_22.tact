struct WithBooleanDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract BooleanDefaultsTest {
    f: WithBooleanDefaults;

    init() {
        self.f = WithBooleanDefaults{};
    }
}