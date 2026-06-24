struct ManyPrimitives {
    i: Int;
    flag: Bool;
    addr: Address;
    s: String;
    c: Cell;
    sl: Slice;
}

contract PrimitivesStorage {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            i: 7,
            flag: false,
            addr: myAddress(),
            s: "hello",
            c: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}