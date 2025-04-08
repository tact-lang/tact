contract MixedSerialization {
    a: Int as int64 = 0;
    b: Int as uint32 = 42;
    c: Int; // 257-bit default

    init() {
        self.c = 1000;
    }
}