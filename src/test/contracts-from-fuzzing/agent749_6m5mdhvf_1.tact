contract Test {
    flag: Bool = false;
    count: Int = 0;
    amount: Int as coins = 0;
    text: String = "hello";

    init() {
        self.flag = true;
        self.count = 42;
        self.amount = ton("1");
        self.text = "world";
    }
}