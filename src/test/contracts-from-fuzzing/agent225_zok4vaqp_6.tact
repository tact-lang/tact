contract MultiplePrimitives {
    a: Int;
    b: Bool;
    c: Bool?;
    d: String;
    e: String?;
    f: Address;
    g: Address?;
    h: Cell;
    i: Cell?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = "hello";
        self.e = null;
        self.f = myAddress();
        self.g = null;
        self.h = emptyCell();
        self.i = null;
    }
}