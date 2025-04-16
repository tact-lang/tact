struct BigFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: String?;
    i: Int?;
    j: Cell?;
}

contract BigFieldsTest {
    s: BigFields;

    init() {
        self.s = BigFields{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress(),
            h: null,
            i: null,
            j: null
        };
    }
}
