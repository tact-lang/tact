struct BigStruct {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Slice;
    i: Builder;
    j: Address;
}

contract LotsOfFields {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 42,
            b: false,
            c: "hi",
            d: null,
            e: null,
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: beginCell(),
            j: myAddress(),
        };
    }
}