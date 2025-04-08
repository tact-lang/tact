struct NestedDefaults {
    a: Int = 1;
    b: Bool;
}

struct OuterDefault {
    inner: NestedDefaults = NestedDefaults{ b: true };
}

contract ComplexDefaultsNested {
    v: OuterDefault;
    init() {
        self.v = OuterDefault{};
    }
}