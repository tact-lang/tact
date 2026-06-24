struct BigStruct {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
    g: Int?;
    h: Bool?;
    i: Cell?;
    j: Slice?;
    k: Address?;
    l: String?;
}

contract HasBigStruct {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            a: 1,
            b: true,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: myAddress(),
            f: "test",
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
        };
    }
}