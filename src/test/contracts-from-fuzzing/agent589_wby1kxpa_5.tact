struct BigFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract Test {
    v: BigFields;

    init() {
        self.v = BigFields{
            a: 1,
            b: true,
            c: myAddress(),
            d: "hi",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
        };
    }
}