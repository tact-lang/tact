// fields with different int serialization widths
contract IntWidths {
    a: Int as uint8;   // 0..255
    b: Int as int16;  // -32768..32767
    c: Int as uint32; // 0..2^32-1

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
    }
}