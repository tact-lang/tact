contract ManyPrimitives {
    n: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    t: String;
    optInt: Int?;
    optAddr: Address?;

    init() {
        self.n = 1;
        self.b = false;
        self.a = myAddress();
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.t = "text";
        self.optInt = null;
        self.optAddr = null;
    }
}