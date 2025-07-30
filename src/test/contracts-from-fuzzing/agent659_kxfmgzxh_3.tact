contract ManyFieldsContract {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    addr: Address;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "ok";
        self.c = emptyCell();
        self.addr = myAddress();
    }
}
