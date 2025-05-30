contract OptionalSerializeMix {
    a: Int? as coins;
    b: Int? as uint8;
    c: Int? as int64;

    init() {
        self.a = ton("1");
        self.b = 5;
        self.c = -64;
    }
}
