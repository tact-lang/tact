struct NestedOptionalStruct {
    field1: Int?;
    field2: Int;
}

contract TestContract {
    nested: NestedOptionalStruct;

    init() {
        self.nested = NestedOptionalStruct{
            field1: null,
            field2: 123
        };
    }
}