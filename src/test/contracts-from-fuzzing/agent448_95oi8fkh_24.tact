struct NestedBoolDefaults {
    f1: Bool = false;
    f2: Bool = true;
}

struct OuterWithDefaults {
    inner: NestedBoolDefaults = NestedBoolDefaults{};
}

contract OuterWithDefaultsContract {
    data: OuterWithDefaults;

    init() {
        self.data = OuterWithDefaults{};
    }

    receive() {}
}