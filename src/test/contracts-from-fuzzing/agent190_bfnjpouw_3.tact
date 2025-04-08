struct ManyFields {
    a: Int;
    b: Int as uint32;
    c: Int?;
    d: Bool;
    e: Bool?;
    f: Address;
    g: Address?;
    h: Cell;
    i: Cell?;
    j: Slice;
    k: Slice?;
    l: String;
    m: String?;
}

contract TestContract {
    record: ManyFields;

    init() {
        self.record = ManyFields{
            a: 10,
            b: 20,
            c: null,
            d: true,
            e: null,
            f: myAddress(),
            g: null,
            h: emptyCell(),
            i: null,
            j: emptyCell().asSlice(),
            k: null,
            l: "ok",
            m: null,
        };
    }
}