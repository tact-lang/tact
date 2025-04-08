struct Combo {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
}

contract Test {
    c: Combo;
    init() {
        self.c = Combo{
            i: 5,
            b: true,
            s: "ok",
            addr: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell()
        };
    }
}