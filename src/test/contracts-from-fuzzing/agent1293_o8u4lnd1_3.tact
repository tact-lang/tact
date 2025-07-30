contract TestContract {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: String;

    init() {
        self.i = 1;
        self.b = true;
        self.a = myAddress();
        self.c = emptyCell();
        self.s = "test";
    }
}