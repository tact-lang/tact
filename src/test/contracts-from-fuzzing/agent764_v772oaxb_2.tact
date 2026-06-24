struct Flat {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Cell;
    f: Slice;
    g: Address;
    h: Bool?;
    i: Int?;
    j: Address?;
}

contract Test {
    data: Flat;

    init() {
        self.data = Flat{
            a: 1,
            b: 2,
            c: true,
            d: "ok",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: myAddress(),
            h: null,
            i: null,
            j: null
        };
    }
}