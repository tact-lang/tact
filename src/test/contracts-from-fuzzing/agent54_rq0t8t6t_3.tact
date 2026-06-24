struct ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: Address;
    l: Address?;
}

contract ManyFieldsContract {
    record: ManyFields;

    init() {
        self.record = ManyFields{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: "hi",
            f: null,
            g: emptyCell(),
            h: null,
            i: emptyCell().asSlice(),
            j: null,
            k: myAddress(),
            l: null
        };
    }
}