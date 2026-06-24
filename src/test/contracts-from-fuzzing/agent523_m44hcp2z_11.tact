struct BuilderWrap { builder: Builder }
struct CellWrap { cell: Cell }
struct SliceWrap { slice: Slice }

contract CellKinds {
    b: BuilderWrap;
    c: CellWrap;
    s: SliceWrap;

    init() {
        self.b = BuilderWrap{ builder: beginCell() };
        self.c = CellWrap{ cell: emptyCell() };
        self.s = SliceWrap{ slice: emptyCell().asSlice() };
    }
}
