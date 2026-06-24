contract IntWithSerialization {
    a: Int as coins;
    b: Int as int64;
    c: Int as uint32;

    init() {
        self.a = ton("0.1");
        self.b = -9223372036854775808; // min int64
        self.c = 4294967295; // max uint32
    }
}
