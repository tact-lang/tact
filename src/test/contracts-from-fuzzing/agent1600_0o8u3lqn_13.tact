struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "str";
}

struct OuterDefaults {
    nested: WithDefaults;
}

contract NestedDefaultsContract {
    d: OuterDefaults;

    init() {
        self.d = OuterDefaults{nested: WithDefaults{}};
    }
}