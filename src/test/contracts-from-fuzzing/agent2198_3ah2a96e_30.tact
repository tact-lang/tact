contract SerializeBits {
    a: Int as int1;
    b: Int as int8;
    c: Int as int16;
    d: Int as int32;

    init() {
        self.a = 1;
        self.b = 127;
        self.c = 32767;
        self.d = 2147483647;
    }
}