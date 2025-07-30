contract TestContract {
    text: String;
    maybeInt: Int?;
    maybeStr: String?;
    flag: Bool;
    maybeFlag: Bool?;

    init() {
        self.text = "abc";
        self.maybeInt = null;
        self.maybeStr = null;
        self.flag = true;
        self.maybeFlag = null;
    }
}