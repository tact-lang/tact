contract Test {
    a: Int = 1;
    b: Bool = true;
    c: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    d: Cell;
    e: Slice;
    f: String = "Test string";

    init() {
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
    }
}