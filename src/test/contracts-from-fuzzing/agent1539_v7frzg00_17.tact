struct ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
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

contract BigPersistent {
    data: ManyFields;
    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: null,
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