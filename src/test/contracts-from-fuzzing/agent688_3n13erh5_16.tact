contract TestContract {
    p1: Int as uint8 = 0;
    p2: Int as uint16 = 0;
    p3: Int as uint32 = 0;
    p4: Int as uint64 = 0;
    p5: Int as int251 = 0;

    init() {
        self.p1 = 1;
        self.p2 = 2;
        self.p3 = 3;
        self.p4 = 4;
        self.p5 = 5;
    }
}