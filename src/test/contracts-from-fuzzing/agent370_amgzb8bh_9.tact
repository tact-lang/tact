contract ManyPrimitives {
    int1: Int;
    int2: Int?;
    flag1: Bool;
    flag2: Bool?;
    text1: String;
    text2: String?;

    init() {
        self.int1 = 1;
        self.int2 = null;
        self.flag1 = true;
        self.flag2 = null;
        self.text1 = "txt";
        self.text2 = null;
    }
}