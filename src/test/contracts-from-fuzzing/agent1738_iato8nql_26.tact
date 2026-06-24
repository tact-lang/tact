contract TestContract {
    num1: Int as uint64;
    num2: Int as int128;
    num3: Int as uint256;

    init() {
        self.num1 = 123456789;
        self.num2 = -12345678901234567890;
        self.num3 = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    }
}