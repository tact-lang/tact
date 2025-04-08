contract TestContract {
    s: Int;
    b: Bool;
    a: Address;
    c: Cell;

    init() {
        self.s = 1;
        self.b = true;
        self.a = myAddress();
        self.c = emptyCell();
    }
}