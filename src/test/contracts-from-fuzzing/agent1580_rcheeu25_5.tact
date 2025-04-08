struct Big {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool;
    i: String;
    j: Address?;
    k: Cell?;
    l: Slice?;
}

contract TestContract {
    data: Big;

    init() {
        self.data = Big{
            a: 1,
            b: false,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: true,
            i: "test",
            j: null,
            k: null,
            l: null,
        };
    }
}