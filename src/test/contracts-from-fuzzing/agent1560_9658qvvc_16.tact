contract FieldOrderTest {
    f1: Int as uint8;
    f2: Int;
    f3: Int as int16;
    f4: Int as uint64;
    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = 3;
        self.f4 = 4;
    }
}