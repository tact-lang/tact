contract Serializations {
    a: Int as int64;
    b: Int as uint32;
    c: Int as coins;
    d: Bool;

    init() {
        self.a = 0;
        self.b = 1;
        self.c = 2;
        self.d = true;
    }
}
