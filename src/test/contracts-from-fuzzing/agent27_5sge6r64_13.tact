contract TestContract {
    a: Int;
    b: Bool;
    c: Bool?;
    d: Cell;
    e: String;
    f: Address;
    g: Int?;
    h: Bool;
    i: String;
    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = emptyCell();
        self.e = "hello";
        self.f = myAddress();
        self.g = null;
        self.h = false;
        self.i = "world";
    }
}
