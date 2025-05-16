struct BigFields {
    x1: Int;
    x2: Bool;
    x3: Cell;
    x4: Slice;
    x5: Address;
    x6: String;
    x7: Int?;
    x8: Bool?;
    x9: Cell?;
    x10: Slice?;
    x11: Address?;
    x12: String?;
}

contract TestBig {
    big: BigFields;

    init() {
        self.big = BigFields{
            x1: 0,
            x2: false,
            x3: emptyCell(),
            x4: emptyCell().asSlice(),
            x5: myAddress(),
            x6: "",
            x7: null,
            x8: null,
            x9: null,
            x10: null,
            x11: null,
            x12: null,
        };
    }
}