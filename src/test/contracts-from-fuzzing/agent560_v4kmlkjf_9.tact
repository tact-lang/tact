struct Huge {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: String?;
    k: Cell?;
    l: Slice?;
}

contract BigStruct {
    data: Huge;

    init() {
        self.data = Huge{
            a: 1,
            b: false,
            c: myAddress(),
            d: "str",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
        };
    }
}