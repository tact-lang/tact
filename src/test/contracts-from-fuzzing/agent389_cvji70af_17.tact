struct NestedDefaults {
    x: Int = 1;
    y: Bool = true;
}

struct OuterDefaults {
    inner: NestedDefaults = NestedDefaults{};
    str: String = "s";
}

contract DefaultsInStructs {
    field: OuterDefaults;

    init() {
        self.field = OuterDefaults{};
    }
}