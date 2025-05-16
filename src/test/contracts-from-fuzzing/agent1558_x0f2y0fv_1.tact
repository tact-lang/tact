struct InnerStruct {
    field1: Int;
    field2: Bool?;
}

contract TestContract {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{ field1: 1, field2: true };
    }
}