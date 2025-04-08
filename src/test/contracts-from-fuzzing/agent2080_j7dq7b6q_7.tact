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

contract TestContract {
    s: BigStruct;
    init() {
        self.s = BigStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "text",
            g: 2,
            h: false,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}