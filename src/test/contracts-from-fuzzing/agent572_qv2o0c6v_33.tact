struct NestedDefaults {
    a: Int = 10;
    b: InnerNest;
}

struct InnerNest {
    val: Bool = true;
}

contract NestedDefaultsTest {
    s: NestedDefaults;
    init() {
        self.s = NestedDefaults { b: InnerNest{} };
    }
}