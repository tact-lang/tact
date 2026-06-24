contract StringAndOptional {
    text1: String?;
    text2: String;
    text3: String?;

    init() {
        self.text1 = null;
        self.text2 = "hello";
        self.text3 = null;
    }
}