struct NestedStruct {
    field1: Int;
    field2: Bool;
}

contract StructFieldTest {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            field1: 1,
            field2: true,
        };
    }
}