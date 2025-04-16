struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String;
    j: Address;
}

contract ManyFieldsContract {
    data: ManyFields;
    init() {
        self.data = ManyFields {
            a: 1,
            b: true,
            c: "abc",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: "xyz",
            j: myAddress(),
        };
    }
}