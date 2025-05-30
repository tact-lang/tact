contract TestContract {
    num1: Int as int64;
    num2: Int as uint64;
    num3: Int as int128;
    num4: Int as uint128;

    init() {
        self.num1 = -5000000000;
        self.num2 = 5000000000;
        self.num3 = -1234567890123456789;
        self.num4 = 1234567890123456789;
    }
}
