contract PrimitiveFields {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    si: Int?;
    sb: Bool?;
    ss: String?;
    sa: Address?;
    sc: Cell?;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "test";
        self.a = myAddress();
        self.c = emptyCell();
        self.si = null;
        self.sb = false;
        self.ss = null;
        self.sa = null;
        self.sc = null;
    }
}