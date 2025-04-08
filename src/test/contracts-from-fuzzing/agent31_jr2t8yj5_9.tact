contract Test {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Cell;
    f: Slice;
    g: String;
    h: Address;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = "Hello";
        self.h = myAddress();
    }
}
