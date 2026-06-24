contract MaxSizeFields {
    val1: Int as uint8 = 0;
    val2: Int as uint64 = 0;
    val3: Int as coins = 0;

    init() {
        self.val1 = 1;
        self.val2 = 2;
        self.val3 = 3;
    }
}