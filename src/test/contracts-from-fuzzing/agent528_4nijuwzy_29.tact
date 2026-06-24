contract SerializerConfusion {
    xi: Int? as int8;     // optional 8-bit signed int
    xu: Int? as uint8;    // optional 8-bit unsigned int
    si: Int as int8;      // signed 8-bit
    su: Int as uint8;     // unsigned 8-bit

    init() {
        self.xi = null;
        self.xu = 17;
        self.si = -100;
        self.su = 250;
    }
}
