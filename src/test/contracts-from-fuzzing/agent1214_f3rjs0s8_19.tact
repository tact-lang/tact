contract BoolsAndStrings {
    flag1: Bool;
    flag2: Bool?;
    msg1: String;
    msg2: String?;
    init() {
        self.flag1 = true;
        self.flag2 = null;
        self.msg1 = "hi";
        self.msg2 = null;
    }
}