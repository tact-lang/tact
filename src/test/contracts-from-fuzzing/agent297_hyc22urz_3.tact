struct S {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
    g: Bool?;
    h: Int?;
    i: String?;
}

contract TestContract {
    field: S;

    init() {
        self.field = S{
            a: 1,
            b: true,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: myAddress(),
            f: "ok",
            g: null,
            h: 123,
            i: null
        };
    }
}