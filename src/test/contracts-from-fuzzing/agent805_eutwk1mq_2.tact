contract TestContract {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
    i: String;
    j: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = false;
        self.e = myAddress();
        self.f = null;
        self.g = emptyCell();
        self.h = null;
        self.i = "hello";
        self.j = null;
    }
}