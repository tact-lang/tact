struct NestedDefaults {
    a: Int = 1;
    b: SubNested;
}

struct SubNested {
    c: Int = 5;
    d: Bool = true;
}

contract NestedDefaultVals {
    prop: NestedDefaults;

    init() {
        self.prop = NestedDefaults{ b: SubNested{} };
    }
}