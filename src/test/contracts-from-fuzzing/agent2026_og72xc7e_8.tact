contract TestContract {
    bigInt: Int as int257;
    smallInt: Int as int8;
    flag: Bool;
    bigString: String;
    tinyInt: Int as uint4;

    init() {
        self.bigInt = 123456789012345678901234567890;
        self.smallInt = 7;
        self.flag = true;
        self.bigString = "hello world";
        self.tinyInt = 5;
    }
}