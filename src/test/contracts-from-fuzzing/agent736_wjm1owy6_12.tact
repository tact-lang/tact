contract TestContract {
    val1: Int = 1;
    val2: Int as int64 = 2;
    val3: Int as uint8 = 3;
    val4: Int as coins = 4;

    init() {
        self.val1 = 1;
        self.val2 = 2;
        self.val3 = 3;
        self.val4 = 4;
    }

    receive() {
        dump(self.val1);
        dump(self.val2);
        dump(self.val3);
        dump(self.val4);
    }
}