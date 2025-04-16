contract TestContract {
    flag: Bool;
    count: Int as uint8;
    text: String;
    optStr: String?;
    signedNum: Int as int16;
    coinVal: Int as coins;

    init() {
        self.flag = true;
        self.count = 255;
        self.text = "hi";
        self.optStr = null;
        self.signedNum = -100;
        self.coinVal = 1000;
    }

    receive() {
        self.flag = false;
        self.count = 1;
        self.text = "bye";
        self.optStr = "text";
        self.signedNum = 50;
        self.coinVal = 2000;
    }
}