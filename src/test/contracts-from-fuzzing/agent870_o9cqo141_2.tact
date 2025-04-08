struct BigStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Cell?;
    l: Slice?;
    m: Builder?;
}

contract BigTest {
    stuff: BigStruct;

    init() {
        self.stuff = BigStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: "hi",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
            m: null,
        };
    }
}