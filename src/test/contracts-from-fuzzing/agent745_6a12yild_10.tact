struct NestedDefaults {
    a: Int = 1;
    b: Bool? = null;
}

struct OuterDefaults {
    nested: NestedDefaults = NestedDefaults{};
    c: Slice? = null;
}

contract NestedDefaultsContract {
    data: OuterDefaults;

    init() {
        self.data = OuterDefaults{};
    }
}