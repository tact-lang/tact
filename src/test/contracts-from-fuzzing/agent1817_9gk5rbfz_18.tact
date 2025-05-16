struct NestedWithDefaults {
    a: Int = 10;
    b: String = "x";
}

struct OuterDefault {
    nested: NestedWithDefaults = NestedWithDefaults{};
    flag: Bool = true;
}

contract NestedDefaultsTest {
    state: OuterDefault;

    init() {
        self.state = OuterDefault{};
    }
}
