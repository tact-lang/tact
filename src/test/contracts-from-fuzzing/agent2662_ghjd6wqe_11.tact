contract MultiTypeFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;

    init() {
        self.a = 5;
        self.b = null;
        self.c = true;
        self.d = false;
        self.e = "abc";
        self.f = null;
        self.g = emptyCell();
        self.h = null;
    }
}