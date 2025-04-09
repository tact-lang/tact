contract EdgeTypes {
    c: Cell;
    s: String;
    b: Bool;
    i: Int;
    a: Address;
    init() {
        self.c = emptyCell();
        self.s = "";
        self.b = false;
        self.i = 0;
        self.a = myAddress();
    }
}