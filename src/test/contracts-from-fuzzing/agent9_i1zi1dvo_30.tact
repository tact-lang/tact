contract OptionalSerializeMix {
    a: Int? as int8;
    b: Int? as uint8;
    c: Int? as int16;
    d: Int? as uint32;
    e: Int? as int64;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}