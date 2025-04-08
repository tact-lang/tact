struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: String?;
    h: Bool?;
    i: Address?;
    j: Cell?;
}

contract VariedFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: "hello",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}
