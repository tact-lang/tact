contract ManyBasicFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Cell;
    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = "x";
        self.f = null;
        self.g = myAddress();
        self.h = emptyCell();
    }
}