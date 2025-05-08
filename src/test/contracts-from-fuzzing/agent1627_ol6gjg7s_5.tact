struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String;
    f: Address;
    g: Slice;
    h: Builder;
    i: Cell;
    j: String?;
}

contract BigStructStorage {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 123,
            b: true,
            c: "xyz",
            d: null,
            e: "hi",
            f: myAddress(),
            g: emptyCell().asSlice(),
            h: beginCell(),
            i: emptyCell(),
            j: null
        };
    }
}
