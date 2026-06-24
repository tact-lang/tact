contract WeirdOrder {
    flag: Bool;
    text: String;
    num: Int;

    init() {
        self.num = 42;
        self.flag = true;
        self.text = "yo";
    }
}