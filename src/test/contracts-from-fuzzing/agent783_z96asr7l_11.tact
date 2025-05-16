contract MixedOptionals {
    num: Int;
    maybeNum: Int?;
    truth: Bool;
    maybeFlag: Bool?;
    msg: String;
    maybeMsg: String?;

    init() {
        self.num = 5;
        self.maybeNum = null;
        self.truth = false;
        self.maybeFlag = true;
        self.msg = "hi";
        self.maybeMsg = null;
    }
}