struct InnerNested {
    field1: Int;
    field2: String;
}

struct NestedStruct {
    nestedField: InnerNested;
    amount: Int;
    text: String;
}

contract NestedContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            nestedField: InnerNested{
                field1: 10,
                field2: "hello",
            },
            amount: 5,
            text: "hi",
        };
    }
}