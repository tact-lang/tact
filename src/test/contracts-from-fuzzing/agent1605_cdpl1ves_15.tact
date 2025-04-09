struct BoolDefaults {
    b1: Bool = true;
    b2: Bool = false;
}

contract BoolDefaultsTest {
    data: BoolDefaults;

    init() {
        self.data = BoolDefaults{};
    }
}