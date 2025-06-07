struct NestedDefaults {
    x: Int = -1;
    y: Bool = true;
}

struct Outer {
    inner: NestedDefaults = NestedDefaults{};
    z: Int = 42;
}

contract ComposeDefault {
    f: Outer;
    init() {
        self.f = Outer{};
    }
}