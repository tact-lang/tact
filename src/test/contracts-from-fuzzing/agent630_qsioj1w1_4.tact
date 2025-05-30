struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
}

contract ComplexFields {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: 1,
            b: false,
            c: "c",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}