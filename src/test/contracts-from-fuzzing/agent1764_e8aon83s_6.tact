struct LargeParams {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
}

contract TestLarge {
    data: LargeParams;

    init() {
        self.data = LargeParams{
            a: 1,
            b: false,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: "abc",
            f: myAddress(),
            g: null,
            h: true,
            i: null,
            j: null
        };
    }
}