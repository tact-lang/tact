contract TestContract {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as coins;

    init() {
        self.a = 12;
        self.b = 3456;
        self.c = -78910;
        self.d = ton("12.34");
    }
}