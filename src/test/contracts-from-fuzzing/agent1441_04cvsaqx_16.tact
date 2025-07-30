contract SerialOrder {
    num1: Int as int64;
    num2: Int as uint32;
    num3: Int as coins;
    flag: Bool;
    message: String;

    init() {
        self.num1 = 42;
        self.num2 = 255;
        self.num3 = 1234567890;
        self.flag = true;
        self.message = "hello";
    }
}