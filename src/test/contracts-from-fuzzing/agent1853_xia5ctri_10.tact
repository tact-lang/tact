contract FieldOrder {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint16;
    d: Bool;
    e: String;
    f: Cell;

    init() {
        self.a = 1;
        self.b = -42;
        self.c = 1000;
        self.d = true;
        self.e = "test";
        self.f = emptyCell();
    }
}