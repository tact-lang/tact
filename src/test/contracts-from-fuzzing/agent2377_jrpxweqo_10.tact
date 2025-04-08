struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: String;
    l: String?;
}

contract MixedNullables {
    data: Combo;

    init() {
        self.data = Combo{
            a: 1,
            b: null,
            c: false,
            d: null,
            e: myAddress(),
            f: null,
            g: emptyCell(),
            h: null,
            i: emptyCell().asSlice(),
            j: null,
            k: "x",
            l: null,
        };
    }
}