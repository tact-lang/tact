struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: String?;
    g: Bool?;
    h: Int as uint32;
    i: Cell;
    j: Builder;
    k: Slice;
}

contract StructStorage {
    st: ManyFields;

    init() {
        self.st = ManyFields{
            a: 1,
            b: false,
            c: "hi",
            d: myAddress(),
            e: null,
            f: null,
            g: true,
            h: 15,
            i: emptyCell(),
            j: beginCell(),
            k: emptyCell().asSlice()
        };
    }
}
