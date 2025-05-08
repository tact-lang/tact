struct NestedDefaults {
    a: Int = 1;
    b: String? = null;
}

struct OuterDefaults {
    inner: NestedDefaults = NestedDefaults{};
}

contract DefaultNest {
    f: OuterDefaults;

    init() {
        self.f = OuterDefaults{};
    }
}