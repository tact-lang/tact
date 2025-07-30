struct MultiFields {
    i1: Int;
    i2: Int;
    b1: Bool;
    s1: String;
    c1: Cell;
    sl1: Slice;
    bl1: Builder;
    addr: Address;
}

contract TestContract {
    mf: MultiFields;

    init() {
        self.mf = MultiFields{
            i1: 1,
            i2: 2,
            b1: true,
            s1: "test",
            c1: emptyCell(),
            sl1: emptyCell().asSlice(),
            bl1: beginCell(),
            addr: myAddress()
        };
    }
}