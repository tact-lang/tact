contract ManyPrimitiveFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = false;
        self.e = "hi";
        self.f = null;
        self.g = emptyCell();
        self.h = emptyCell();
        self.i = myAddress();
        self.j = myAddress();
    }
}