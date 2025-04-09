struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
}

contract VarietyFields {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: true,
            c: "test",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress()
        };
    }
}