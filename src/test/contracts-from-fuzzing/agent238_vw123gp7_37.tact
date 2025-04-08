struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
}

struct NestedManyDefaults {
    m: ManyDefaults;
    n: ManyDefaults;
}

contract TestManyDefaults {
    lots: NestedManyDefaults;
    init() {
        self.lots = NestedManyDefaults{
            m: ManyDefaults{},
            n: ManyDefaults{}
        };
    }
}