struct InnerWithDefaults {
    flag: Bool = true;
    count: Int = 10;
}

contract NestedDefaultsTest {
    pers: InnerWithDefaults;

    init() {
        self.pers = InnerWithDefaults{};
    }
}
