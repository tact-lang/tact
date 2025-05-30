struct ComplexFields {
    a: Int;
    b: Bool?;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: String?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: Builder?;
}

contract ComplexStore {
    field: ComplexFields;

    init() {
        self.field = ComplexFields{
            a: 1,
            b: true,
            c: "abc",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: "opt",
            i: myAddress(),
            j: emptyCell(),
            k: emptyCell().asSlice(),
            l: beginCell()
        };
    }
}