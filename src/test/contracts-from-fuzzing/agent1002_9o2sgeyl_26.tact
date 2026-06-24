struct NestedDefaults {
    foo: Int = 1;
    bar: Bool = false;
}

struct OuterDefaults {
    nested: NestedDefaults = NestedDefaults{};
    baz: Int = 10;
}

contract DefaultsInStructs {
    data: OuterDefaults;

    init() {
        self.data = OuterDefaults{};
    }
}