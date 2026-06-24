contract TestContract {
    val1: Int as int8 = 7;
    val2: Int as int16 = 300;
    val3: Int as int32 = 100000;
    val4: Int as int64 = 10000000000;

    init() {
        self.val1 = -7;
        self.val2 = -300;
        self.val3 = -100000;
        self.val4 = -10000000000;
    }
}