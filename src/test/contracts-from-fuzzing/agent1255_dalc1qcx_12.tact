struct BoolDefaults {
    a: Bool = false;
    b: Bool = true;
}

contract BoolDefaultsTest {
    x: BoolDefaults;
    init() {
        self.x = BoolDefaults{};
    }
}