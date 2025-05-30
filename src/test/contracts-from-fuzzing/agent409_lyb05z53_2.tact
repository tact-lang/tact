struct ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Cell?;
    j: String?;
    k: Bool?;
    l: Int;
}

contract ManyFieldsContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: myAddress(),
            d: "Hi",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: null,
            j: null,
            k: null,
            l: 42,
        };
    }
}