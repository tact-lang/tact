struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: String?;
    f: Cell;
    g: Slice;
    h: Int?;
    i: String;
    j: Address;
    k: Int;
    l: Bool;
}

contract Complex {
    state: ManyFields;

    init() {
        self.state = ManyFields{
            a: 1,
            b: false,
            c: "x",
            d: null,
            e: null,
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: null,
            i: "y",
            j: myAddress(),
            k: 2,
            l: true
        };
    }
}
