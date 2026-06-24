contract OptSerialization {
    a: Int? as int8 = null;
    b: Int? as uint16 = null;
    c: Int? as int32 = null;

    init() {
        self.a = -1;
        self.b = 65535;
        self.c = 123456;
    }
}
