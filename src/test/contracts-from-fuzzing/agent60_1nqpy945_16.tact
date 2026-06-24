contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Address?;
    j: Cell?;

    init() {
        self.a = 3;
        self.b = true;
        self.c = "str";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = null;
        self.g = false;
        self.h = null;
        self.i = null;
        self.j = null;
    }
}