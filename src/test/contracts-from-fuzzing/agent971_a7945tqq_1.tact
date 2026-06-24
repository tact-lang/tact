struct NestedStruct {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestContract {
    field1: Int;
    field2: Bool;
    field3: String;
    nested: NestedStruct;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = "test";
        self.nested = NestedStruct{a: 2, b: false, c: null};
    }
}