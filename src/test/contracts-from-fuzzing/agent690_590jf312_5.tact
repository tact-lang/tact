struct ManyPrimitives {
    i: Int;
    b: Bool;
    addr: Address;
    c1: Cell;
    sl: Slice;
    s: String;
}

contract Variety {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            i: 42,
            b: false,
            addr: myAddress(),
            c1: emptyCell(),
            sl: emptyCell().asSlice(),
            s: "text"
        };
    }
}