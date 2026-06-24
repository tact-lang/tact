struct Big {
    a: Int as uint8;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: String?;
    h: Cell?;
    i: Inner;
}

struct Inner {
    x: Int;
}

contract Test {
    item: Big;

    init() {
        self.item = Big{
            a: 1,
            b: true,
            c: "test",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: Inner{ x: 10 }
        };
    }
}