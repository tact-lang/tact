struct Flat {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
    g: Bool?;
    h: Int?;
    i: Cell?;
    j: Slice?;
    k: Address?;
    l: String?;
}

contract TestFlat {
    flat: Flat;

    init() {
        self.flat = Flat{
            a: 1,
            b: true,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: myAddress(),
            f: "hello",
            g: false,
            h: 42,
            i: emptyCell(),
            j: null,
            k: null,
            l: "world",
        };
    }
}
