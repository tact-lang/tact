struct BoolDefaults {
    a: Bool = false;
    b: Bool = true;
}

contract BoolDefaultsTest {
    s: BoolDefaults;

    init() {
        self.s = BoolDefaults{};
    }
}
