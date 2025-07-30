contract SerializationWidths {
    a: Int as uint8;   // 0..255
    b: Int as int16;   // -32768..32767
    c: Int as uint64;  // 0..2^64-1
    d: Int as int32;   // -2^31..2^31-1

    init() {
        self.a = 0;
        self.b = 0;
        self.c = 0;
        self.d = 0;
    }

    receive() {}
}