struct NestedStruct {
    nsField1: Int;
    nsField2: Bool;
    nsField3: String;
}

contract NestedFieldsContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            nsField1: 42,
            nsField2: false,
            nsField3: "test",
        };
    }

    receive() {}
}