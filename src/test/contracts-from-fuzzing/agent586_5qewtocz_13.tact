contract MixedPrimitives {
    n: Int;
    text: String;
    flag: Bool;
    optN: Int?;
    optText: String?;
    optFlag: Bool?;

    init() {
        self.n = 1;
        self.text = "abc";
        self.flag = true;
        self.optN = null;
        self.optText = null;
        self.optFlag = null;
    }

    receive() {
        self.n = self.n + 1;
    }
}