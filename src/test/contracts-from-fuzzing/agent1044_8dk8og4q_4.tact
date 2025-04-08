struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Builder;
    f: Slice;
    g: Address;
    h: Bool?;
    i: Int?;
    j: String;
}

contract TestContract {
    payload: ManyFields;

    init() {
        self.payload = ManyFields{
            a: 1,
            b: false,
            c: "hi",
            d: emptyCell(),
            e: beginCell(),
            f: emptyCell().asSlice(),
            g: myAddress(),
            h: null,
            i: null,
            j: "bye"
        };
    }
}
