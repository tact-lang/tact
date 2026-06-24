contract Test8 {
    a: Int = 1;
    b: Bool = false;
    c: Address;
    d: Cell;

    init() {
        self.c = myAddress();
        self.d = emptyCell();
    }
}