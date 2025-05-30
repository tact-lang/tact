contract ManyFieldsContract {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Slice;
    f: Cell;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Address?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = myAddress();
        self.d = "hi";
        self.e = emptyCell().asSlice();
        self.f = emptyCell();
        self.g = null;
        self.h = true;
        self.i = null;
        self.j = null;
        self.k = null;
    }
}