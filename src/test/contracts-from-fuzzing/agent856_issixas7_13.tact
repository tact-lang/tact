contract BoolIntStringFields {
    flag: Bool;
    number: Int;
    text: String;

    init() {
        self.flag = true;
        self.number = 42;
        self.text = "hello";
    }
}