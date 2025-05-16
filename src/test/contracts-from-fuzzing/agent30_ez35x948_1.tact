struct NestedStruct {
    field1: Int;
    field2: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    subfield1: String;
    subfield2: Int?;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            field1: 10,
            field2: true,
            inner: InnerStruct{
                subfield1: "Test",
                subfield2: null,
            },
        };
    }
}