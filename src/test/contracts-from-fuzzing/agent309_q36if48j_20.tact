contract SerializationSizeCheck {
    a: Int as uint4 = 0; // max 15
    b: Int as uint8 = 0; // max 255
    c: Int as uint32 = 0; // max 2^32-1
    d: Int as int64 = 0;  // signed

    init() {
        self.a = 15;
        self.b = 255;
        self.c = 4294967295;
        self.d = 9223372036854775807;
    }
}