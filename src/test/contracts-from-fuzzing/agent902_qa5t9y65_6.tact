struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: Address;
    l: Address?;
}

contract MixedOptionalFields {
    data: Combo;

    init() {
        self.data = Combo{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "hi",
            f: null,
            g: emptyCell(),
            h: null,
            i: emptyCell().asSlice(),
            j: null,
            k: myAddress(),
            l: null
        };
    }
}