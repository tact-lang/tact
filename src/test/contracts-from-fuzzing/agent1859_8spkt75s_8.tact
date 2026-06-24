contract OrderingTest {
    a: Int as uint8;
    b: Int as int64;
    c: Bool;
    d: String;
    e: Address;
    f: Cell;
    g: Slice;

    init() {
        self.a = 1;
        self.b = -64;
        self.c = true;
        self.d = "order";
        self.e = myAddress();
        self.f = emptyCell();
        self.g = self.f.asSlice();
    }
}