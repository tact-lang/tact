struct NestedDefaults {
    x: Int = 1;
}

struct OuterDefaults {
    y: NestedDefaults = NestedDefaults{};
}

contract NestedDefaultVals {
    f: OuterDefaults;

    init() {
        self.f = OuterDefaults{};
    }
}