contract IntSerialization {
    a: Int as int8 = 127;
    b: Int as int8 = -128;
    c: Int as uint8 = 255;
    d: Int as uint8 = 0;
    e: Int as int16 = -32768;
    f: Int as int16 = 32767;

    init() {
        self.a = 100;
        self.b = -100;
    }
}