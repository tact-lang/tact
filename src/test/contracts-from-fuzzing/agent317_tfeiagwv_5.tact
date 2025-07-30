contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = emptyCell();
        self.e = myAddress();
        self.f = null;
        self.g = false;
        self.h = null;
        self.i = null;
        self.j = null;
    }
}