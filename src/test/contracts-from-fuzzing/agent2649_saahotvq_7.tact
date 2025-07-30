struct NestedDefaults {
    x: Int = 1;
    y: Bool = false;
}

struct Outer {
    inner: NestedDefaults = NestedDefaults{};
    z: Int = 100;
}

contract NestedDefaultsTest {
    val: Outer;

    init() {
        self.val = Outer{};
    }
}