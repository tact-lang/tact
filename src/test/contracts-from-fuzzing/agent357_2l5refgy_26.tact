contract PrimFields {
    a: Int = 5;
    b: Bool = false;
    c: String = "sample";
    d: Cell;
    e: Slice;

    init() {
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
    }
}