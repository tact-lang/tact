struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedStructStorage {
    field: NestedStruct;

    init() {
        self.field = NestedStruct{
            a: 10,
            b: true,
            c: "test",
        };
    }
}