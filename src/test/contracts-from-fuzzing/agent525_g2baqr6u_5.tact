contract Test {
    flag: Bool = true;
    text: String = "hello";
    num: Int = 42;
    optFlag: Bool? = null;
    optText: String? = null;
    optNum: Int? = null;

    init() {
        self.flag = false;
        self.text = "world";
        self.num = 24;
        self.optFlag = true;
        self.optText = "!";
        self.optNum = 100;
    }
}
