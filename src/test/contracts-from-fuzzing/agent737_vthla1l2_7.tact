contract VariousPrimitives {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
    g: Int?;
    h: Bool?;
    i: Cell?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = emptyCell().asSlice();
        self.e = myAddress();
        self.f = "Hello";
        self.g = null;
        self.h = null;
        self.i = null;
    }
}