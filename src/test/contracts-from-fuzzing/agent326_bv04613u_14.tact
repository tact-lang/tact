struct NestedDefaults {
    a: Int = 1;
    b: String = "x";
}

struct OuterDefaults {
    nested: NestedDefaults = NestedDefaults{};
    flag: Bool = false;
}

contract TestNestedDefaults {
    val: OuterDefaults;

    init() {
        self.val = OuterDefaults{};
    }
}
