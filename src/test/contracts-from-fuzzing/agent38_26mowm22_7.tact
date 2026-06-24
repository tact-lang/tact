struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: String?;
    h: Bool?;
    i: Int?;
    j: Cell;
    k: Address;
    l: String;
}

contract TestContract {
    s: BigStruct;
    init() {
        self.s = BigStruct{
            a: 1,
            b: true,
            c: "x",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: true,
            i: null,
            j: emptyCell(),
            k: myAddress(),
            l: "y"
        };
    }
}
