struct ManyNestedWithDefaults {
    s: String = "hi";
    flag: Bool = false;
    num: Int = 99;
}

struct OuterNestedDefaults {
    nested: ManyNestedWithDefaults;
}

contract NestedDefaultsFields {
    data: OuterNestedDefaults;

    init() {
        self.data = OuterNestedDefaults{ nested: ManyNestedWithDefaults{} };
    }
}