struct WithBoolDefaults {
    f1: Bool = true;
    f2: Bool = false;
    f3: Bool = true;
}

contract BoolDefaultsTest {
    val: WithBoolDefaults;

    init() {
        self.val = WithBoolDefaults{};
    }
}