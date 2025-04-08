contract ManyOptionAndVals {
    a: Int?;
    b: Int = 1;
    c: Bool?;
    d: Bool = true;
    e: String?;
    f: String = "str";
    g: Address?;
    h: Address;
    i: Cell?;
    j: Cell;

    init() {
        self.a = null;
        self.c = null;
        self.e = null;
        self.g = null;
        self.i = null;
        self.h = myAddress();
        self.j = emptyCell();
    }
}