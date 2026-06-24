struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract BigFields {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: false,
            c: "text",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
            i: null,
        };
    }
}
