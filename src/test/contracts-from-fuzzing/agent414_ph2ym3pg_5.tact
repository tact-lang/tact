contract ManyPrimitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    bo: Bool?;
    si: String?;
    ai: Address?;
    ci: Cell?;
    init() {
        self.i = 1;
        self.b = true;
        self.s = "ok";
        self.a = myAddress();
        self.c = emptyCell();
        self.bo = false;
        self.si = null;
        self.ai = null;
        self.ci = null;
    }
}
