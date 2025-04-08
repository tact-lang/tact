contract ManyOptionals {
    flag1: Bool?;
    flag2: Bool?;
    val1: Int?;
    val2: Int?;
    text: String?;

    init() {
        self.flag1 = null;
        self.flag2 = true;
        self.val1 = null;
        self.val2 = 42;
        self.text = null;
    }
}