struct InnerDef {
    val1: Int = 42;
    val2: Int = 7;
}

struct OuterDef {
    inner: InnerDef;
    val3: Int = 99;
}

contract NestedDefaults {
    data: OuterDef;

    init() {
        self.data = OuterDef{ inner: InnerDef{}, val3: 100 };
    }
}
