struct ManyPrimitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bu: Builder;
}

contract StructOfPrimitives {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            i: 10,
            b: true,
            s: "hello",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
        };
    }
}