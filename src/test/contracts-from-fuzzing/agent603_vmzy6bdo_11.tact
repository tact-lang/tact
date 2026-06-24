contract TestContract {
    data1: Int as uint8 = 0;
    data2: Int as int64 = 1;
    data3: Int as uint256 = 2;
    data4: Int as int1 = 0;
    data5: Int as uint4 = 4;
    data6: Int as int257 = 6;

    init() {
        self.data1 = 10;
        self.data2 = 11;
        self.data3 = 12;
        self.data4 = 1;
        self.data5 = 5;
        self.data6 = 13;
    }
}