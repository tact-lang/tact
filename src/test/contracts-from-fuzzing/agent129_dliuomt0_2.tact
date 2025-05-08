struct SevenFields {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Cell;
    f: Slice;
    g: Address?;
}

contract LargeMixed {
    data: SevenFields;

    init() {
        self.data = SevenFields{
            a: 1,
            b: null,
            c: "Hi",
            d: null,
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
        };
    }
}
