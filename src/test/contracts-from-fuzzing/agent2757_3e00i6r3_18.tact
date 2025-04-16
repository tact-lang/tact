contract OptionalSerialization {
    a: Int? as uint8;
    b: Int? as int16;
    c: Int? as int257;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}