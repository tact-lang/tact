struct NestedDefaults {
    x: Int = 5;
    y: Int?;
}

contract NestedDefaultsTest {
    field: NestedDefaults;

    init() {
        self.field = NestedDefaults{}; // omit all defaults/default null
    }
}