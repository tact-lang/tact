contract TestContract {
    val1: Int as int64;
    val2: Int as uint3;
    val3: Int as int1;
    val4: Int as uint256;

    init() {
        self.val1 = -100;
        self.val2 = 7;
        self.val3 = -1;
        self.val4 = 123456789;
    }
}