contract InitDefaultMix {
    number: Int = 1;
    text: String;
    flag: Bool;
    init() {
        self.text = "hello";
        self.flag = true;
    }
    receive() {}
}