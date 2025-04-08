struct WithManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Builder;
    g: Slice;
    h: Int;
    i: Bool;
    j: String;
    k: Address;
    l: Cell;
    m: Builder;
    n: Slice;
}

contract StructManyFields {
    data: WithManyFields;

    init() {
        self.data = WithManyFields{
            a: 1,
            b: true,
            c: "hi",
            d: myAddress(),
            e: emptyCell(),
            f: beginCell(),
            g: emptyCell().asSlice(),
            h: 2,
            i: false,
            j: "bye",
            k: myAddress(),
            l: emptyCell(),
            m: beginCell(),
            n: emptyCell().asSlice()
        };
    }
}