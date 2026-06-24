contract TestContract {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
    e: String;
    f: Int?;
    g: Bool?;
    h: Cell?;
    i: Address?;
    j: String?;
    init() {
        self.a = 1; self.b = true; self.c = emptyCell(); self.d = myAddress(); self.e = "hi";
        self.f = null; self.g = false; self.h = emptyCell(); self.i = null; self.j = null;
    }
}