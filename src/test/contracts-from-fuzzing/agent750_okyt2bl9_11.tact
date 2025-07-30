struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
}

contract NestedDefaultsTest {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{};
    }
}
