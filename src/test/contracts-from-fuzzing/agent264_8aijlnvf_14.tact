contract MixedTypes {
    flag: Bool;
    num: Int;
    text: String;
    opt1: Bool?;
    opt2: String?;
    opt3: Int?;

    init() {
        self.flag = true;
        self.num = 42;
        self.text = "data";
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
    }
}