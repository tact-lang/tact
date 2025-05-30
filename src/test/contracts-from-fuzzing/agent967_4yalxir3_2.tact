struct Flat {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
    e: Slice;
    f: String;
    g: Bool?;
    h: Int?;
    i: Cell?;
    j: String?;
}

contract FlatManyFields {
    storage: Flat;

    init() {
        self.storage = Flat{
            a: 1,
            b: false,
            c: emptyCell(),
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: "hi",
            g: null,
            h: null,
            i: null,
            j: null
        };
    }
}
