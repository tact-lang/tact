struct NestedStruct {
    field1: Int;
    field2: Int?;
}

contract DeepNestedContract {
    nested: NestedStruct;
    optNested: NestedStruct?;

    init() {
        self.nested = NestedStruct{
            field1: 1,
            field2: null,
        };

        self.optNested = null;
    }
}