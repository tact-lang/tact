struct CellSlice {
    c: Cell;
    s: Slice;
}

contract CellSliceTest {
    f: CellSlice;

    init() {
        self.f = CellSlice{
            c: emptyCell(),
            s: beginCell().endCell().asSlice()
        };
    }
}