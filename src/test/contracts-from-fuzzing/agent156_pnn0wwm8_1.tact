struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    field1: Int;
    field2: Bool;
    nested: InnerStruct;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.nested = InnerStruct{ a: 2, b: false };
    }
}
