struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String;
}

contract TestContract {
    storage: ManyFields;
    init() {
        self.storage = ManyFields{
            a: 1,
            b: true,
            c: "string",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: null,
            j: "again"
        };
    }
}
