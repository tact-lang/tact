contract BoolStringFields {
    flag1: Bool;
    flag2: Bool;
    message1: String;
    message2: String;

    init() {
        self.flag1 = false;
        self.flag2 = true;
        self.message1 = "hello";
        self.message2 = "world";
    }
}
