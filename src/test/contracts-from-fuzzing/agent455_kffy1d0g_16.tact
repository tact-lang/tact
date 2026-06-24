struct Sample {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Slice;
    h: Cell;
    j: Address;
}

contract AllFieldTypes {
    s: Sample;

    init() {
        self.s = Sample{
            a: 1,
            b: true,
            c: "hi",
            d: null,
            e: false,
            f: null,
            g: emptyCell().asSlice(),
            h: emptyCell(),
            j: myAddress(),
        };
    }
}