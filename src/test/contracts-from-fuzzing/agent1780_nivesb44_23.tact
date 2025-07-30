contract BoolStringMix {
    flag: Bool;
    text: String;
    check: Bool;
    msg: String;

    init() {
        self.flag = true;
        self.text = "abc";
        self.check = false;
        self.msg = "def";
    }
}