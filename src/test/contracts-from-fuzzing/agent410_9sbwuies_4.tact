struct ManyFields {
    a: Int;
    b: Int as uint32;
    c: Int as int16;
    d: Int?;
    e: Bool;
    f: Bool?;
    g: Address;
    h: String;
    i: Cell;
    j: Slice;
    k: Builder;
}

contract TestContract {
    stuff: ManyFields;

    init() {
        self.stuff = ManyFields{
            a: 1,
            b: 2,
            c: 3,
            d: null,
            e: true,
            f: false,
            g: myAddress(),
            h: "x",
            i: emptyCell(),
            j: emptyCell().asSlice(),
            k: beginCell(),
        };
    }
}
