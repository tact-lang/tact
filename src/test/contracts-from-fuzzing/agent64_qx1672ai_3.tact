struct Deep {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Address;
}

contract Test3 {
    deep: Deep;
    init() {
        self.deep = Deep{
            a: 1,
            b: true,
            c: "3",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
            i: "x",
            j: myAddress()
        };
    }
}