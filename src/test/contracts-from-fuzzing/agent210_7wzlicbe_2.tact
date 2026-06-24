struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
}

contract NestedStorage {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            a: 1,
            b: true,
            c: "hello",
            d: null,
        };
    }
}