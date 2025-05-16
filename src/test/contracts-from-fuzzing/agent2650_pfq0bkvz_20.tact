contract Test {
    num: Int as int64;
    big: Int;
    flg: Bool;
    txt: String;
    optNum: Int?;

    init() {
        self.num = 42;
        self.big = -1000000000000;
        self.flg = true;
        self.txt = "hello";
        self.optNum = null;
    }
}