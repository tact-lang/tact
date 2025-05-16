contract TestContract {
    num1: Int;
    num2: Int as int32;
    num3: Int as uint8;
    num4: Int as int64;
    num5: Int as uint32;

    init() {
        self.num1 = 1;
        self.num2 = 2;
        self.num3 = 3;
        self.num4 = 4;
        self.num5 = 5;
    }
}