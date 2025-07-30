contract InitOmitted {
    data: Int;
    flag: Bool;
    text: String;

    init() {
        self.data = 10;
        self.flag = true;
        self.text = "abc";
    }
}