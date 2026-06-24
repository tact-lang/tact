struct NestedStruct {
    nested: InnerStruct;
}

struct InnerStruct {
    field: Int;
}

contract OverwriteTest {
    ns: NestedStruct;
    init() {
        self.ns = NestedStruct{ nested: InnerStruct{ field: 5 } };
        self.ns = NestedStruct{ nested: InnerStruct{ field: 15 } };
    }
}