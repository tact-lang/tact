struct NestedDefaults {
    inn: Int = 1;
    s: String = "x";
}

struct OuterWrap {
    i1: NestedDefaults;
    i2: NestedDefaults;
}

contract NestedDefaultsWrap {
    f: OuterWrap;

    init() {
        self.f = OuterWrap{ i1: NestedDefaults{}, i2: NestedDefaults{} };
    }
}