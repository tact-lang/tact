struct NestedDefaults {
    val1: Int = 5;
    val2: Bool = false;
}

contract NestedDefaultsTest {
    d: NestedDefaults;

    init() {
        self.d = NestedDefaults{};
    }
}
