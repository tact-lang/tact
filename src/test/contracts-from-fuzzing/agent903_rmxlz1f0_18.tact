struct NestedDefaults {
    x: Int = 123;
}

struct OuterDefaults {
    inner: NestedDefaults = NestedDefaults{};
}

contract NestedDefaultsPersist {
    field: OuterDefaults;

    init() {
        self.field = OuterDefaults{};
    }
}