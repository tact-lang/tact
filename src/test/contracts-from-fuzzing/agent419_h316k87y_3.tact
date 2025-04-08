struct Big {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: Bool?;
    f: Slice;
    g: Cell;
    h: String;
}

contract Test {
    big: Big;

    init() {
        self.big = Big{
            a: 1,
            b: false,
            c: myAddress(),
            d: null,
            e: null,
            f: emptyCell().asSlice(),
            g: emptyCell(),
            h: "hi"
        };
    }
}