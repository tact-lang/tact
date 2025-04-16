struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Slice;
    i: Int?;
    j: Address?;
    k: Bool;
    l: String;
    m: Cell?;
    n: Slice?;
}

contract BigTest {
    st: BigStruct;

    init() {
        self.st = BigStruct{
            a: 1,
            b: true,
            c: "hi",
            d: myAddress(),
            e: null,
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: null,
            j: null,
            k: false,
            l: "bye",
            m: null,
            n: null
        };
    }
}