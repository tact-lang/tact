struct BigStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Slice;
    h: Cell;
    i: Int as uint32;
    j: Int as int64;
    k: Address;
    l: Int?;
    m: Bool;
    n: String?;
    o: Int;
}

contract BigPersist {
    blob: BigStruct;

    init() {
        self.blob = BigStruct{
            a: 1,
            b: null,
            c: false,
            d: null,
            e: "hi",
            f: null,
            g: emptyCell().asSlice(),
            h: emptyCell(),
            i: 5,
            j: 6,
            k: myAddress(),
            l: null,
            m: true,
            n: null,
            o: 999
        };
    }
}