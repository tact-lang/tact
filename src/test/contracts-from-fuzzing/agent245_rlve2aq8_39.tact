struct HasBoolDefaults {
    a: Bool = false;
    b: Bool = true;
}

contract BoolDefaultsTest {
    s: HasBoolDefaults;

    init() {
        self.s = HasBoolDefaults{};
    }
}