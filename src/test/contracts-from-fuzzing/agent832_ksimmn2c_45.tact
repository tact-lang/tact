struct AllPrimitive {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
}

contract AllPrimitiveContract {
    data: AllPrimitive;

    init() {
        self.data = AllPrimitive{
            i: 5,
            b: true,
            s: "ok",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress(),
        };
    }
}