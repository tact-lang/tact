struct BigStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: Bool?;
    f: String;
    g: Cell;
    h: Slice;
    i: Builder;
    j: String;
    k: Int;
    l: Bool;
    m: Int?;
}

contract WithBigStruct {
    data: BigStruct;
    init() {
        self.data = BigStruct{
            a: 1,
            b: false,
            c: myAddress(),
            d: null,
            e: null,
            f: "abc",
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: beginCell(),
            j: "def",
            k: 123,
            l: true,
            m: null
        };
    }
}
