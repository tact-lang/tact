struct BoolDefaults {
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;
}

contract BoolDefaultsTest {
    val: BoolDefaults;

    init() {
        self.val = BoolDefaults{};
    }
}