contract Test {
    a: Int;
    b: Int as int64;
    c: Int as uint32;
    d: Bool;
    e: Cell;
    f: Slice;
    g: String;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = emptyCell();
        self.f = self.e.asSlice();
        self.g = "hello";
    }
}