struct Combo {
    i: Int = -1;
    b: Bool = false;
    s: String = "test";
    addr: Address;
    cl: Cell;
    sl: Slice;
    bl: Builder;
}

contract ComplexFields {
    combo: Combo;

    init() {
        self.combo = Combo{
            i: 33,
            b: true,
            s: "hello",
            addr: myAddress(),
            cl: emptyCell(),
            sl: emptyCell().asSlice(),
            bl: beginCell()
        };
    }

    receive() {
        let _ = self.combo.i;
    }
}