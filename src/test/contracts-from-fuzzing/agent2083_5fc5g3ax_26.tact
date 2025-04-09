contract NestedIntSerializations {
    n1: Int as uint8;
    n2: Int as int16;
    n3: Int as uint32;
    n4: Int;

    init() {
        self.n1 = 1;
        self.n2 = -2;
        self.n3 = 3;
        self.n4 = 4;
    }
}
