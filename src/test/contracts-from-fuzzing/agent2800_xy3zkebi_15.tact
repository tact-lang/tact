contract Test {
    num: Int;
    text: String;
    flag: Bool;
    optionalInt: Int?;
    optionalStr: String?;
    optionalBool: Bool?;

    init() {
        self.num = 123;
        self.text = "hello";
        self.flag = true;
        self.optionalInt = null;
        self.optionalStr = null;
        self.optionalBool = false;
    }
}