struct Big {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
}

contract Huge {
    val: Big;

    init() {
        self.val = Big{
            a: 1,
            b: true,
            c: "test",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}