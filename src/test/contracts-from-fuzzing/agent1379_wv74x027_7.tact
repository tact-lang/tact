struct NestedOptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

struct OuterDefaults {
    inner: NestedOptDefaults = NestedOptDefaults{};
    x: Int = 42;
}

contract DefaultStructs {
    storage: OuterDefaults;

    init() {
        self.storage = OuterDefaults{};
    }
}
