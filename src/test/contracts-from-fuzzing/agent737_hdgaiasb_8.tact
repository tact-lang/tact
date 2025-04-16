contract TestContract {
    num: Int as uint32;
    flag: Bool;
    text: String;

    init() {
        self.num = 123;
        self.flag = true;
        self.text = "test";
    }
}
