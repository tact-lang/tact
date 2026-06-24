struct NestedDefaults {
    i: Int = 1;
    b: Bool = false;
}

struct InnerDefaults {
    x: Int = 42;
    nested: NestedDefaults = NestedDefaults{};
}

contract FuzzStructDefaults {
    s: InnerDefaults;

    init() {
        self.s = InnerDefaults{};
    }
}
