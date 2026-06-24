struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;
    d: Bool = false;
}

contract BoolDefaultsTest {
    val: BoolDefaults;

    init() {
        self.val = BoolDefaults{};
    }
}