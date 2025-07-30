struct BoolDefaults {
    flag1: Bool = false;
    flag2: Bool = true;
}

contract BoolDefaultsTest {
    data: BoolDefaults;
    init() {
        self.data = BoolDefaults{};
    }
}