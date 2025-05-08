struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
}

contract NestedStorage {
    item: NestedStruct;

    init() {
        self.item = NestedStruct {
            a: 42,
            b: false,
            c: "hi",
            d: null,
        };
    }
}