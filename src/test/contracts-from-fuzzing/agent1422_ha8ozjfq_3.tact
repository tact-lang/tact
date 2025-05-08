struct Big {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: String?;
    h: Bool?;
    i: Int?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}

contract ManyTypes {
    data: Big;

    init() {
        self.data = Big{
            a: 1,
            b: true,
            c: "hi",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
        };
    }
}