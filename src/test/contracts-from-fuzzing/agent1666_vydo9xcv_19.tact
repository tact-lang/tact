contract OptionSerialize {
    a: Int? as uint8;
    b: Int? as uint32;
    c: Int? as int64;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}