contract Test1 {
    num: Int;
    flag: Bool;
    text: String;

    init() {
        self.num = 42;
        self.flag = true;
        self.text = "hello";
    }

    receive() {}
}