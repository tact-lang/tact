contract FieldOrderTest {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as int64;
    e: Int;
    f: Bool;
    g: String;
    h: Address;
    i: Cell;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = true;
        self.g = "hello";
        self.h = myAddress();
        self.i = emptyCell();
    }
}