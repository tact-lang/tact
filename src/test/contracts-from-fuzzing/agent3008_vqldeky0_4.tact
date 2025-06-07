struct ManyFields {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Builder;
    f: String;
    g: Int?;
    h: String?;
    i: Address;
    j: Cell?;
    k: Bool;
    l: Int;
}

contract TestStorage {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: false,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: beginCell(),
            f: "hello",
            g: null,
            h: null,
            i: myAddress(),
            j: null,
            k: true,
            l: 123,
        };
    }
}