struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Bool?;
    h: Cell?;
    i: Address?;
    j: String?;
}

contract ManyFieldsContract {
    data: ManyFields;
    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: "test",
            d: emptyCell(),
            e: myAddress(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
            j: null
        };
    }
}