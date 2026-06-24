contract NestedInstantiation {
    a: Int;
    b: Bool;
    s: String;
    nested: NestedStruct;

    init() {
        self.a = 1;
        self.b = false;
        self.s = "str";
        self.nested = NestedStruct{ innerVal: 7 };
    }
}

struct NestedStruct {
    innerVal: Int;
}