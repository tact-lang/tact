struct ManyFields {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Address;
    g: Bool?;
    h: String?;
    i: Int?;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: "hi",
            f: myAddress(),
            g: null,
            h: null,
            i: null
        };
    }
}