struct NestedStruct {
    a: Int;
    b: Bool;
    c: String?;
}

contract NestedFields {
    field: NestedStruct;

    init() {
        self.field = NestedStruct{
            a: 1,
            b: true,
            c: "hello",
        };
    }
}