struct ManyPrimitives {
    x: Int;
    flag: Bool;
    addr: Address;
    text: String;
    c: Cell;
    bl: Builder;
    sl: Slice;
}

contract VariousPrimitivesContract {
    dat: ManyPrimitives;

    init() {
        self.dat = ManyPrimitives{
            x: 42,
            flag: true,
            addr: myAddress(),
            text: "data",
            c: emptyCell(),
            bl: beginCell(),
            sl: emptyCell().asSlice()
        };
    }
}