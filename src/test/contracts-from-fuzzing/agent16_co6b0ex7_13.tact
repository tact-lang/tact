struct Primitives {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    addr: Address;
}

contract PrimitiveFields {
    val: Primitives;

    init() {
        self.val = Primitives{
            i: 1,
            b: true,
            s: "hi",
            c: emptyCell(),
            sl: "hello".asComment().asSlice(),
            bu: beginCell(),
            addr: myAddress(),
        };
    }
}