struct Mixed {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: Bool?;
    i: Cell?;
    j: String?;
}

contract MixedFields {
    data: Mixed;

    init() {
        self.data = Mixed{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
            g: null,
            h: null,
            i: null,
            j: null
        };
    }
}