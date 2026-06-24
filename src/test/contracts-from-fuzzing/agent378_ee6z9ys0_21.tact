contract TestContract {
    num: Int as uint32;
    numOpt: Int?;
    flag: Bool;
    flagOpt: Bool?;
    text: String;
    textOpt: String?;

    init() {
        self.num = 100;
        self.numOpt = null;
        self.flag = true;
        self.flagOpt = false;
        self.text = "hi";
        self.textOpt = null;
    }
}