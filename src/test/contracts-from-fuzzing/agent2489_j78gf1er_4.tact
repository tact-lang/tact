struct ManyFields {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: String;
    f: String;
    g: Cell;
    h: Slice;
    i: Builder;
    j: Address;
    k: Int?;
    l: Bool?;
    m: String;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: 2,
            c: true,
            d: false,
            e: "hi",
            f: "test",
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: beginCell(),
            j: myAddress(),
            k: null,
            l: null,
            m: "end"
        };
    }
}
