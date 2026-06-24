contract TestContract {
    n1: Int as uint4;
    n2: Int as int8;
    n3: Int as uint64;
    n4: Int as int128;
    n5: Int as coins; // variable size encoding

    init() {
        self.n1 = 1;
        self.n2 = -5;
        self.n3 = 123456789;
        self.n4 = 1234567890123456;
        self.n5 = ton("1");
    }
}