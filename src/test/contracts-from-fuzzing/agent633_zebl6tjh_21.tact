contract SerializationEdge {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int as int257;

    init() {
        self.a = 255; // valid uint8 max
        self.b = -32768;  // valid int16 min
        self.c = 18446744073709551615; // uint64 max
        self.d = -1; // int257 min is -2^256 but -1 is easily in range
    }
}