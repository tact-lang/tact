contract MixedSerialization {
    int1: Int as uint8;
    int2: Int as int64;
    int3: Int as coins;

    init() {
        self.int1 = 10;
        self.int2 = -1000;
        self.int3 = ton("1");
    }
}