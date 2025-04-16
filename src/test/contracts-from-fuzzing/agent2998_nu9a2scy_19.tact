struct BoolOptionDefaults {
    flag1: Bool = true;
    flag2: Bool = false;
    flag3: Bool?;
    flag4: Bool?;
}

contract BoolDefaultsTest {
    vals: BoolOptionDefaults;
    init() {
        self.vals = BoolOptionDefaults{};
    }
}