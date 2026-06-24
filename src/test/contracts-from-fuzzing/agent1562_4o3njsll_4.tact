struct BigStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
}

contract BigStructContract {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "sample",
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}
