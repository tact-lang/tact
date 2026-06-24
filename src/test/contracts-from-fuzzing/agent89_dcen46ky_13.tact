contract Fuzz13 {
    num1: Int as uint8 = 0;
    num2: Int as uint16 = 1;
    num3: Int as int32 = -5;
    num4: Int as uint64 = 12345;
    num5: Int = -42;

    init() {
        self.num1 = 5;
        self.num2 = 300;
        self.num3 = -10;
        self.num4 = 999999;
        self.num5 = -99;
    }
}