struct NoOptional {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Slice;
    f: Cell;
}

contract NoOptTest {
    s: NoOptional;

    init() {
        self.s = NoOptional{
            a: 1,
            b: true,
            c: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            d: "hi",
            e: emptyCell().asSlice(),
            f: emptyCell(),
        };
    }
}