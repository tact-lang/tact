contract ManyIntsSerialized {
    n1: Int as uint4;
    n2: Int as int8;
    n3: Int as uint12;
    n4: Int as int32;
    n5: Int as uint64;

    init() {
        self.n1 = 5;
        self.n2 = -7;
        self.n3 = 1000;
        self.n4 = -123456;
        self.n5 = 123456789;
    }
}
