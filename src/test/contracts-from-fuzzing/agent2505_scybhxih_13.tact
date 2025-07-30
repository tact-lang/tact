struct Primitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bu: Builder;
}

contract AllPrimitiveTypes {
    data: Primitives;

    init() {
        self.data = Primitives{
            i: 1,
            b: true,
            s: "hi",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell()
        };
    }
}