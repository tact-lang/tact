contract OptionalSlicesAndCells {
    a: Slice?;
    b: Cell?;

    init() {
        self.a = null;
        self.b = null;
    }
}