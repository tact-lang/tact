contract TestContract {
    f1: Int as uint4 = 1;
    f2: Int as int8 = -1;
    f3: Int as uint16 = 255;
    f4: Int as int32 = -500;
    f5: Int as uint64 = 12345;
    f6: Int as int128 = -9999999;
    f7: Int as uint256 = 123456789;

    init() {
        self.f1 = 2;
        self.f2 = -2;
        self.f3 = 200;
        self.f4 = -1000;
        self.f5 = 987654321;
        self.f6 = -8888888;
        self.f7 = 7777777;
    }

    receive() {
        let v = self.f3;
    }
}