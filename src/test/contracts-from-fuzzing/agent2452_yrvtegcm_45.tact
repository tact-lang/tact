struct NestedDefaults {
    x: Int = 5;
    y: Bool = true;
}

contract NestedDefaultsContract {
    n: NestedDefaults = NestedDefaults{};
    init() {
        self.n = NestedDefaults{};
    }
}