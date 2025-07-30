contract CombinationContract {
    num: Int;
    flag: Bool;
    text: String;
    optNum: Int?;
    optStr: String?;

    init() {
        self.num = -2;
        self.flag = false;
        self.text = "hi";
        self.optNum = null;
        self.optStr = "present";
    }
}