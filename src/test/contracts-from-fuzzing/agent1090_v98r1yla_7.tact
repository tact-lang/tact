struct NestedDefaults {
    a: Int = 1;
    b: Int = 2;
}

struct OuterDefaults {
    x: NestedDefaults = NestedDefaults{};
    y: Int = 42;
}

contract NestedDefaultsContract {
    s: OuterDefaults;

    init() {
        self.s = OuterDefaults{};
    }
}