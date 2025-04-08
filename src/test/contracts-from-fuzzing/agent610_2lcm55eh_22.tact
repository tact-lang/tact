// Many optional fields with serialization
contract OptSerial {
    a: Int? as int8;
    b: Int? as uint8;
    c: Int? as int16;
    d: Int? as uint16;
    e: Int? as int32;
    f: Int? as uint32;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
    }
}