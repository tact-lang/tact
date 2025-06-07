struct ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Bool?;
    h: Address?;
    i: Int?;
    j: String;
}

contract ManyFieldsTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "abc",
            g: null,
            h: null,
            i: null,
            j: "xyz"
        };
    }
}