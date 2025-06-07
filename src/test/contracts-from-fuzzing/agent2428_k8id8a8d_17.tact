contract InitVsDefault {
    count: Int;
    flag: Bool;
    text: String;

    init() {
        self.count = 42;
        self.flag = true;
        self.text = "hello";
    }
}