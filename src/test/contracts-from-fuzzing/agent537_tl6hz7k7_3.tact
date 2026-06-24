struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Cell;
    g: Slice;
    h: Bool?;
    i: Address;
    j: Address?;
}

contract TestContract {
    mf: ManyFields;

    init() {
        self.mf = ManyFields{
            a: 1,
            b: true,
            c: "hi",
            d: null,
            e: "there",
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: false,
            i: myAddress(),
            j: null
        };
    }

    receive() {
        self.mf = self.mf; // no change
    }
}
