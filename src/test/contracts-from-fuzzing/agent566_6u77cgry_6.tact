struct LongFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Address;
    j: Slice;
}

contract TestLongFields {
    val: LongFields;

    init() {
        self.val = LongFields{
            a: 1,
            b: true,
            c: "text",
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: null,
            g: null,
            h: null,
            i: myAddress(),
            j: emptyCell().asSlice()
        };
    }
}