struct Big {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: String;
    f: Cell;
    g: Slice;
    h: Address;
    i: String;
    j: Cell;
}

contract BigStructTest {
    val: Big;

    init() {
        self.val = Big{
            a: 1,
            b: false,
            c: 2,
            d: true,
            e: "hi",
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: myAddress(),
            i: "yo",
            j: emptyCell(),
        };
    }
}