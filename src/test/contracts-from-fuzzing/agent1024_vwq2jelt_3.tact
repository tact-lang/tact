contract MultipleOptionals {
    field1: Int?;
    field2: Bool?;
    nestedOpt: NestedStruct?;

    init() {
        self.field1 = null;
        self.field2 = true;
        self.nestedOpt = null;
    }
}

struct NestedStruct {
    x: Int;
    y: Int;
}