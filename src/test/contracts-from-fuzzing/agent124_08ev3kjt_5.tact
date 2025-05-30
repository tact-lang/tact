struct ManyFields {
    a: Int;
    b: Bool;
    c: Slice;
    d: Cell;
    e: String;
    f: Address;
    g: Int?;
    h: Cell?;
    i: String?;
    j: Address?;
}

contract ManyFieldsTest {
    s: ManyFields;
    init() {
        self.s = ManyFields{
            a: 1,
            b: true,
            c: emptyCell().asSlice(),
            d: emptyCell(),
            e: "hi",
            f: myAddress(),
            g: null,
            h: null,
            i: null,
            j: null
        };
    }
}