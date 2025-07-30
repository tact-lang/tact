struct Volatile {
    s: Slice;
    c: Cell;
    o: Cell?;
    k: Slice?;
}

contract ComboCellsSlices {
    v: Volatile;

    init() {
        let ec = emptyCell();
        self.v = Volatile{
            s: ec.asSlice(),
            c: ec,
            o: null,
            k: null
        };
    }
}