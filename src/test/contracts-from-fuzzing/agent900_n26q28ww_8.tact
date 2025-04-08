contract Test {
    val1: Int as uint8;
    val2: Int as uint64;
    val3: Int as coins;
    val4: Int as int257;

    init() {
        self.val1 = 255;
        self.val2 = 123456789;
        self.val3 = ton("1");
        self.val4 = -1;
    }

    receive() {
        self.val1 = (self.val1 + 1) % 256;
        self.val2 += 1;
    }
}