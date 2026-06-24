contract OrderTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint256;
    d: Bool;
    e: String;
    f: Cell;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
        self.d = true;
        self.e = "xyz";
        self.f = emptyCell();
    }
}