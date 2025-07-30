contract TestContract {
    num1: Int as uint8;
    num2: Int as int16;
    num3: Int as int257;
    flag: Bool;

    init() {
        self.num1 = 10;
        self.num2 = -32000;
        self.num3 = 123456789;
        self.flag = true;
    }
}