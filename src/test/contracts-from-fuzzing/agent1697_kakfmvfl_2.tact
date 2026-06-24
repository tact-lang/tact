struct NestedStruct {
    field1: Int;
    field2: Bool;
}

contract StructFieldContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{field1: 10, field2: true};
    }
}