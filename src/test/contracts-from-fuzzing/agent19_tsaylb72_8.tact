struct NestedDefaults {
    i: Int = 5;
    s: String = "x";
    b: Bool = true;
}

struct OuterDefaults {
    nd: NestedDefaults = NestedDefaults{};
    p: Int = 10;
}

contract NestedDefaultValues {
    f: OuterDefaults;

    init() {
        self.f = OuterDefaults{};
    }
}
