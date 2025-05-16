struct ManyFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Slice?;
    i: Address;
    j: Address?;
}

contract BigStructStorage {
    payload: ManyFields;

    init() {
        self.payload = ManyFields{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "text",
            f: null,
            g: emptyCell(),
            h: null,
            i: myAddress(),
            j: null,
        };
    }
}
