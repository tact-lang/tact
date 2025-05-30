contract Test {
    flag: Bool = false;
    count: Int as uint64 = 0;
    text: String = "";
    coin: Int as coins = 0;
    optText: String? = null;

    init() {
        self.flag = true;
        self.count = 42;
        self.text = "hello";
        self.coin = 1000000;
        self.optText = null;
    }
}