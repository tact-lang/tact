struct InnerStruct {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    field1: Int = 0;
    field2: Bool = false;
    nested: InnerStruct = InnerStruct{val1: 1, val2: true};

    init() {
        self.field1 = 42;
        self.field2 = true;
        self.nested = InnerStruct{val1: 5, val2: false};
    }
}