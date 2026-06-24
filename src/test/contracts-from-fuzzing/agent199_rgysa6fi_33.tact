contract SerializationFormats {
    u4: Int as uint4;
    i64: Int as int64;
    c: Cell;

    init() {
        self.u4 = 7;
        self.i64 = -1234;
        self.c = emptyCell();
    }
}
