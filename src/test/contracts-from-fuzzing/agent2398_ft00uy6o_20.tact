struct NestedDefaults {
    x: Int? = null;
    y: Inner = Inner{ z:0 };
}

struct Inner {
    z: Int;
}

contract TestContract {
    s: NestedDefaults;

    init() {
        self.s = NestedDefaults{};
    }
}