contract Test6 {
    num: Int as uint8;
    flag: Bool;
    text: String;
    optInt: Int?;
    optStr: String?;
    flag2: Bool;
    bigNum: Int;
    init() {
        self.num = 255;
        self.flag = true;
        self.text = "hello";
        self.optInt = null;
        self.optStr = "world";
        self.flag2 = false;
        self.bigNum = 123456789;
    }
}
