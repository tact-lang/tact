contract ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = emptyCell();
        self.h = null;
        self.i = myAddress();
        self.j = null;
    }
}