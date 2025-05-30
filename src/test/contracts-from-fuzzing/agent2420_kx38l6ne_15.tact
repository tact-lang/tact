struct CellNest { c: Cell; s: Slice; optC: Cell?; optS: Slice?; }

contract CellFields {
    f: CellNest;

    init() {
        self.f = CellNest{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            optC: null,
            optS: null,
        };
    }
}