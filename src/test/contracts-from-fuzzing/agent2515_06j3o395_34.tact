contract OverwriteFix {
    a: Int as uint4;
    b: Int as uint8;

    init() {
        self.a = 20;  // invalid interim assignment
        self.a = 10;  // valid final assignment

        self.b = 300; // invalid interim
        self.b = 100; // valid
    }
}
