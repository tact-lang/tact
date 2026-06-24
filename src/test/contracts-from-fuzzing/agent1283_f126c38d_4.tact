struct ManyFields {
    a: Int;
    b: Bool;
    c: Cell;
    d: String;
    e: Int?;
    f: Bool;
    g: String;
    h: Address;
    i: Cell;
    j: Bool;
}

contract UseManyFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: false,
            c: emptyCell(),
            d: "ok",
            e: null,
            f: true,
            g: "hi",
            h: myAddress(),
            i: emptyCell(),
            j: true
        };
    }
}