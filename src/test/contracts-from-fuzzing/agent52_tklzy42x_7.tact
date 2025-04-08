struct ManyPrims {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    a: Address;
}

contract StructInStruct {
    outer: ManyPrims;

    init() {
        self.outer = ManyPrims{
            i: 1,
            b: true,
            s: "",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            a: myAddress()
        };
    }
}