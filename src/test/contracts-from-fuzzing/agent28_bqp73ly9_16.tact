struct WithBoolDefaults {
    flag1: Bool = true;
    flag2: Bool = false;
}

contract BoolDefaultsTest {
    val: WithBoolDefaults;

    init() {
        self.val = WithBoolDefaults{};
    }
}