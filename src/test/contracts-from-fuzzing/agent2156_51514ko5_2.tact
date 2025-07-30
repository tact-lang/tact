struct BigStruct {
    a: Int;
    b: Bool;
    c: Cell;
    d: String;
    e: Slice;
    f: Address;
    g: Int;
    h: Bool;
    i: String;
    j: Address;
    k: Bool?;
    l: String?;
}

contract TestBigFields {
    big: BigStruct;
    init() {
        self.big = BigStruct{
            a: 1,
            b: true,
            c: emptyCell(),
            d: "hello",
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: 2,
            h: false,
            i: "world",
            j: myAddress(),
            k: null,
            l: null
        };
    }
}