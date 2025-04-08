struct NestedStruct {
    x: Int;
    y: Int?;
    s: String;
}

contract TestStorage {
    field: NestedStruct;

    init() {
        self.field = NestedStruct{
            x: 1,
            y: null,
            s: "hello",
        };
    }
}