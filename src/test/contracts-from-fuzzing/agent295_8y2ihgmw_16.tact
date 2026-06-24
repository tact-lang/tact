contract OptionalInitAssign {
    val: Int?;
    text: String?;
    flag: Bool?;

    init() {
        self.val = 123;
        self.text = "hello";
        self.flag = true;
    }
}