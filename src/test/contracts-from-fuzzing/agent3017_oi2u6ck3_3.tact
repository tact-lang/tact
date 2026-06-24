struct WithManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract Test {
    data: WithManyPrimitives;

    init() {
        self.data = WithManyPrimitives{
            a: 1,
            b: true,
            c: "test",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
        };
    }
}
