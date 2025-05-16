contract SerializeLayout {
    a: Int as int64;
    b: Int as uint8;
    c: Int as coins;

    init() {
        self.a = 10;
        self.b = 255;
        self.c = ton("1");
    }
}