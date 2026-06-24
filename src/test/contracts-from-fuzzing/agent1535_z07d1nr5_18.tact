struct PrimNest {
    s: Slice;
    b: Builder;
    a: Address;
    c: Cell;
}

contract PersistLowLevel {
    data: PrimNest;

    init() {
        self.data = PrimNest{
            s: emptyCell().asSlice(),
            b: beginCell(),
            a: myAddress(),
            c: emptyCell(),
        };
    }
}
