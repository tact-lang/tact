contract MultiTyped {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;

    init() {
        self.i = 11;
        self.b = true;
        self.s = "hello";
        self.a = myAddress();
        self.c = emptyCell();
    }
}