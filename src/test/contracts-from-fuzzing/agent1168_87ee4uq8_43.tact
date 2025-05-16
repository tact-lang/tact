contract MultiIntSerialization {
    n1: Int as uint32;
    n2: Int as int64;
    n3: Int as uint8;

    init() {
        self.n1 = 123456;
        self.n2 = -654321;
        self.n3 = 250;
    }
}