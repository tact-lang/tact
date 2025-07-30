struct CellLayers {
    c1: Cell;
    c2: Cell?;
    c3: Cell;
    c4: Cell?;
}

contract CellFields {
    persist: CellLayers;

    init() {
        self.persist = CellLayers{
            c1: emptyCell(),
            c2: null,
            c3: emptyCell(),
            c4: null
        };
    }
}