contract BoolsAndStrings {
    flag1: Bool;
    text: String;
    flag2: Bool?;
    optText: String?;

    init() {
        self.flag1 = true;
        self.text = "abc";
        self.flag2 = null;
        self.optText = null;
    }
}
