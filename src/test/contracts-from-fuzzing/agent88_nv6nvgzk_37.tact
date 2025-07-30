contract OptionalSlices {
    s1: Slice?;
    s2: Cell;
    
    init() {
        self.s1 = null;
        self.s2 = emptyCell();
    }
}