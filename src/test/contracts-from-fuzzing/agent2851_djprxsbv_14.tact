contract PersistenceSerialize {
    a: Int as uint8;
    b: Int as int16;
    c: Int;
    d: Bool;
    e: Bool?;

    init() {
        self.a = 10;
        self.b = -100;
        self.c = 500;
        self.d = true;
        self.e = null;
    }
}
