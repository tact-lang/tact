contract BoolIntString {
    flag: Bool;
    number: Int;
    text: String;

    init() {
        self.flag = false;
        self.number = 42;
        self.text = "fuzz";
    }
}