contract TestContract {
    val1: Int as uint4 = 2;
    val2: Int as int8 = -7;
    val3: Int as uint1 = 1;
    val4: Int as int1 = 0;
    val5: Int as int257 = 123456;

    init() {
        self.val2 = 7;
        self.val5 = -654321;
    }

    receive() {
        let _ = self.val3;
    }
}