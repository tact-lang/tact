contract UnusualOrder {
    a: String;
    b: Int as uint8;
    c: Bool;
    d: Cell;
    e: Slice;

    init() {
        self.a = "hello";
        self.b = 255;
        self.c = true;
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
    }
}