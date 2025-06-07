struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract BoolDefaultsTest {
    data: BoolDefaults;
    init() {
        self.data = BoolDefaults{};
    }
}