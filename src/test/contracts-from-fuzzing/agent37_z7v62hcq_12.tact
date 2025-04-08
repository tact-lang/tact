contract Test {
    small1: Int as uint4;
    small2: Int as uint8;
    small3: Int as uint16;
    small4: Int as uint32;
    init() {
        self.small1 = 3;
        self.small2 = 12;
        self.small3 = 1234;
        self.small4 = 123456;
    }
}