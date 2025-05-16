struct MixAllPrimitives {
    i: Int;
    bl: Bool;
    addr: Address;
    cl: Cell;
    sl: Slice;
    str: String;
}

contract AllPrimitivesContract {
    data: MixAllPrimitives;

    init() {
        self.data = MixAllPrimitives{
            i: 1,
            bl: true,
            addr: myAddress(),
            cl: emptyCell(),
            sl: emptyCell().asSlice(),
            str: "test"
        };
    }

    receive() {
        self.data = MixAllPrimitives{
            i: 2,
            bl: false,
            addr: myAddress(),
            cl: emptyCell(),
            sl: emptyCell().asSlice(),
            str: "changed"
        };
    }
}