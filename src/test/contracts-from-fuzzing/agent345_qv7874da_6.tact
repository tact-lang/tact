struct Big {
    a: Int;
    b: Int;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: String;
    h: Bool;
    i: Int;
    j: String;
    k: Slice;
    l: Cell;
}

contract ManyFieldsNested {
    big: Big;

    init() {
        self.big = Big{
            a: 1,
            b: 2,
            c: true,
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: "hi",
            h: false,
            i: 123,
            j: "test",
            k: emptyCell().asSlice(),
            l: emptyCell()
        };
    }
}