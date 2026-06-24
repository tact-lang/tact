contract NestedStructsOptionals {
    s1: Int?;
    s2: InnerStruct?;

    init() {
        self.s1 = null;
        self.s2 = null;
    }
}

struct InnerStruct {
    x: Int;
}
