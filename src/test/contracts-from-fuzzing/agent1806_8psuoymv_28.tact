struct NestedWithDefaults {
    inner1: Int = 1;
    inner2: String = "hi";
}

struct OuterDefault {
    n1: NestedWithDefaults = NestedWithDefaults{};
    n2: NestedWithDefaults = NestedWithDefaults{};
}

contract NestedDefaultsTest {
    d: OuterDefault;
    init() {
        self.d = OuterDefault{};
    }
}