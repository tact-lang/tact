contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Bool?;
    f: String?;
    g: Cell?;
    h: Int?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = emptyCell();
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = null;
    }
}