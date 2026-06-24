struct NestedStruct {
    x: Int;
    y: Bool;
    s: String;
}

contract NestedField {
    field: NestedStruct;

    init() {
        self.field = NestedStruct{
            x: 10,
            y: true,
            s: "hello",
        };
    }
}