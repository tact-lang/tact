struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Builder;
    g: Address;
    h: Bool?;
    i: Int?;
    j: String;
    k: Slice;
    l: Cell;
    m: Builder;
    n: Address;
}

contract ManyFieldsContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: false,
            c: "test",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: beginCell(),
            g: myAddress(),
            h: true,
            i: 42,
            j: "str",
            k: emptyCell().asSlice(),
            l: emptyCell(),
            m: beginCell(),
            n: myAddress()
        };
    }
}