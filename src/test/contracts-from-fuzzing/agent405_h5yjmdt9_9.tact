contract SerializedFields {
    a: Int as int64;
    b: Int as uint32;
    c: Int? as int8;
    d: Int? as uint16;

    init() {
        self.a = -123456789;
        self.b = 987654321;
        self.c = null;
        self.d = 65000;
    }
}