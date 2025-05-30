struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Cell;
}

contract ManyFieldsContract {
    data: ManyFields;

    init() {
        self.data = ManyFields {
            a: 1,
            b: true,
            c: "c",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: false,
            i: "i",
            j: emptyCell()
        };
    }
}