struct ManyPrimitives {
    i: Int;
    b: Bool;
    a: Address;
    s: String;
    c: Cell;
    bu: Builder;
    sl: Slice;
}

contract AllPrimitiveFields {
    data: ManyPrimitives;
    init() {
        self.data = ManyPrimitives{
            i: 5,
            b: true,
            a: myAddress(),
            s: "abc",
            c: emptyCell(),
            bu: beginCell(),
            sl: emptyCell().asSlice(),
        };
    }
}