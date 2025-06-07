struct BigFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Cell;
    e: String;
    f: Address;
    g: Bool?;
    h: Cell;
    i: Slice;
    j: String;
    k: Int;
}

contract Storage {
    field: BigFields;

    init() {
        self.field = BigFields{
            a: 1,
            b: true,
            c: null,
            d: emptyCell(),
            e: "hello",
            f: myAddress(),
            g: false,
            h: emptyCell(),
            i: emptyCell().asSlice(),
            j: "world",
            k: 42,
        };
    }
}