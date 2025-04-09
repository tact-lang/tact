struct BoolDefaults {
    active: Bool = true;
    verified: Bool = false;
}

contract BoolDefaultsTest {
    data: BoolDefaults;

    init() {
        self.data = BoolDefaults{};
    }
}