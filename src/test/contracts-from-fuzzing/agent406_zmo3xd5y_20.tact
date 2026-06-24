struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct Wrap {
    inner: NestedDefaults = NestedDefaults{};
}

contract NestedDefaultsTest {
    s: Wrap;
    init() {
        self.s = Wrap{};
    }
}