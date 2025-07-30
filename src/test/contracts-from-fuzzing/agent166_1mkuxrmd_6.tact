contract TestContract {
    a: Int;
    b: Bool;
    s: String;
    c: Cell;
    addr: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.s = "x";
        self.c = emptyCell();
        self.addr = myAddress();
    }
}