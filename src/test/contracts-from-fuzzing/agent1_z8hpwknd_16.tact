struct InnerDefaults {
    v: Int = 42;
}

struct OuterDefaults {
    nested: InnerDefaults = InnerDefaults{};
}

contract NestedStructWithDefaults {
    s: OuterDefaults;

    init() {
        self.s = OuterDefaults{};
    }
}