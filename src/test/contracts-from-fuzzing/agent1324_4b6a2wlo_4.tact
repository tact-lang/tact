struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: String?;
    g: Bool?;
    h: Int?;
    i: Cell?;
    j: Slice?;
    k: Int;
    l: Bool;
    m: String;
    n: Cell;
    o: Slice;
}

contract BigStructContract {
    field: BigStruct;

    init() {
        self.field = BigStruct{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: null,
            g: null,
            h: null,
            i: null,
            j: null,
            k: 2,
            l: false,
            m: "there",
            n: emptyCell(),
            o: emptyCell().asSlice()
        };
    }
}